require 'rails_helper'

describe Product do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :sku }
    it { is_expected.to validate_uniqueness_of :sku }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :brand }
    it { is_expected.to validate_attachment_content_type(:picture).allowing('image/png', 'image/gif') }
    it { is_expected.to validate_attachment_size(:picture).less_than(5.megabytes) }
    it { is_expected.to have_attached_file(:picture) }
  end

  context 'associations' do
    it { is_expected.to belong_to :brand }
  end
end
