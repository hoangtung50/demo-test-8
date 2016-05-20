class Product < ActiveRecord::Base
	belongs_to :brand

	has_attached_file     :picture, styles: { thumb: "270x180#" }, default_url: "products/pictures/:style/missing.png"
  validates_attachment  :picture, content_type: { content_type: /\Aimage\/.*\Z/ }, size: { less_than: 5.megabyte }

	validates :name,     presence: true
  validates :sku,      presence: true, uniqueness: true
  validates :price,    presence: true
  validates :brand,    presence: true

  def self.find_by_brand_ids(brand_ids)
  	where(brand_id: brand_ids)
  end

  def self.find_by_max_price(max_price)
  	where("price <= ?", max_price)
  end

  def self.find_by_min_price(min_price)
  	where("price >= ?", min_price)
  end
end
