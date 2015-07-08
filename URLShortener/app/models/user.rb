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
    :shortened_urls,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :submitter_id
  )
end
