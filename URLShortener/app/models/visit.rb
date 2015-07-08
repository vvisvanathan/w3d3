# == Schema Information
#
# Table name: visits
#
#  id          :integer          not null, primary key
#  visitor_id  :string           not null
#  visited_url :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Visit < ActiveRecord::Base
  # validates

  belongs_to(
    :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :visitor_id
  )

  belongs_to(
    :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: :short_url,
    foreign_key: :visited_url
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(
      visitor_id: user.id,
      visited_url: shortened_url.short_url
    )
  end
end
