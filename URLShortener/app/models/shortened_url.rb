class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, presence: true
  validates :submitter_id, presence: true
end
