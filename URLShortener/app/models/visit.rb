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
  
end
