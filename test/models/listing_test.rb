# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  user_id     :integer
#  category    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end