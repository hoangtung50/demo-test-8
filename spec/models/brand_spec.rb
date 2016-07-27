# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Brand do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  context 'associations' do
    it { is_expected.to have_many :products }
  end
end
