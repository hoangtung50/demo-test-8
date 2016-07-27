# == Schema Information
#
# Table name: areas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Area < ActiveRecord::Base
  has_many :motels
end
