# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many(
    :submitted_urls,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :submitter_id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :visitor_id
  )

  has_many(
    :visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :shortened_url
  )

  has_many(
    :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tagger_id
  )
end
