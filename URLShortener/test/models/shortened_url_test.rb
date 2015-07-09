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

require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
