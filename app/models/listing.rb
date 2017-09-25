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

class Listing < ApplicationRecord
	belongs_to :user
end
