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

require 'rails_helper'

RSpec.describe Motel, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
