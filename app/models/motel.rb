# == Schema Information
#
# Table name: motels
#
#  id          :integer          not null, primary key
#  title       :string
#  price       :decimal(10, 1)   default(0.0)
#  acreage     :decimal(10, 1)   default(0.0)
#  description :text
#  area_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Motel < ActiveRecord::Base
  belongs_to :area
end
