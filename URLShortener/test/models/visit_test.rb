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

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
