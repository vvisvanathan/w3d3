# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string(1024)     not null
#  short_url    :string
#  submitter_id :string
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true
  validate :user_is_not_spamming

  belongs_to(
    :submitter,
    class_name: "User",
    primary_key: :id,
    foreign_key: :submitter_id
  )

  has_many(
    :visits,
    class_name: "Visit",
    primary_key: :short_url,
    foreign_key: :visited_url
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user
  )

  def self.random_code
    new_code = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(new_code)
      new_code = SecureRandom::urlsafe_base64
    end
    new_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: self.random_code
    )
  end

  def self.get_newest
    ShortenedUrl.last
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where('created_at >= ?', 10.minutes.ago).distinct.count
  end

  def num_recent_submissions_for_user
    submitter.submitted_urls.where('created_at >= ?', 1.minute.ago).count
  end

  private
  def user_is_not_spamming
    if self.num_recent_submissions_for_user > 5
      errors[:base] << "You can only submit 5 URLs a minute!"
    end
  end
end
