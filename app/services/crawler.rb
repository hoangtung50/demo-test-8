require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

class Crawler
  def data
    data = []
    url  = 'http://thuenhasg.com'
    doc  = Nokogiri::HTML(open(url))

    doc.css(".menu_chinh li").each do |category|
      url_category = category.at_css('a')[:href]
      title = category.at_css('a').text
      p url_category
      p title

      next if title == 'Xem thêm'

      data << { category_title: title, subs: get_items(url_category) }
    end
    binding.pry

    data_json = data.to_json
    export_data_json(data_json)
  end

  def get_items(url_category)
    items = []

    doc  = Nokogiri::HTML(open(url_category))

    doc.css(".box_tinrao").each do |item|
      url_item = item.at_css('.tit_tinrao h3 a')[:href]
      items << get_item(url_item)
    end

    items
  end

  def get_item(url_item)

    item = {}
    p url_item

    doc  = Nokogiri::HTML(open(url_item))

    item[:title] = doc.at_css('.tiude_tin').text
    p item[:title]

    mota_ngan = doc.css('.mota_ngan li span')

    item[:gia] = mota_ngan[0].text
    item[:dientich] = mota_ngan[1].text
    item[:chitiet] = doc.at_css('.thongtin_chitiet p').inner_html
    item[:images] = []
    doc.css('.amazingslider-slides li span').each do |image|
      item[:images] << image[:href]
    end

    item
  end

  def export_data_json(data_json)
    tmp_file = "#{Rails.root}/tmp/data.json"

    File.open(tmp_file, 'wb') do |f|
      f.write data_json
    end
  end

  def save_data
    tmp_file = "#{Rails.root}/public/data.json"
    file     = File.read(tmp_file)
    data     = JSON.parse(file).to_a

    data.each do |category|
      next if category.blank?
      name = category['category_title']
      root_category = Category.create(title: name)
      sub_categories = category['subs']
      p sub_categories

      sub_categories.each do |sub_category|
        next if sub_category.blank?
        save_sub_category(sub_category, root_category)
      end
    end
  end

  def save_sub_category(sub_category, category)
    name          = sub_category['sub_category_title']
    description   = sub_category['description']
    new_category  = Category.create(title: name, description: description, parent: category)
    brands        = sub_category['brands']

    brands.each do |brand|
      next if brand.blank?
      save_brand(brand, new_category)
    end
  end

  def save_brand(brand, category)
    name              = brand['brand_title'].strip
    new_brand         = Brand.where(name: name).first_or_create
    catalogs          = brand['catalogs']

    catalogs.each do |catalog|
      next if catalog.blank?
      save_catalog(catalog, new_brand, category)
    end
  end

  def save_catalog(catalog, brand, category)
    catalog_title = catalog['catalog_title']
    new_catalog   = Catalog.create(title: catalog_title, category: category, brand: brand)
    subs          = catalog['subs']

    if subs.present?
      subs.each do |sub|
        next if sub.blank?
        save_sub(sub, new_catalog, brand, category)
      end
    end
  end

  def save_sub(sub, catalog, brand, category)
    if sub['catalog_title'].present?
      save_sub_catalog(sub, catalog, brand, category)
    else
      save_product(sub, catalog)
    end
  end

  def save_sub_catalog(catalog, parent_catalog, brand, category)
    catalog_title = catalog['catalog_title']
    new_catalog   = Catalog.create(title: catalog_title, category: category, brand: brand, parent: parent_catalog)
    subs          = catalog['subs']

    subs.each do |sub|
      next if sub.blank?
      save_sub(sub, new_catalog, brand, category)
    end
  end

  def save_product(product, catalog)
    title         = product['product_title']
    description   = product['description']
    new_product   = Product.create(name: title, description: description, catalog: catalog)
    details       = product['details']
    images        = product['images']

    images.each do |image|
      next if image.blank?
      img_link = URI.encode(format_link(image))
      next if img_link.include?('[')
      res = Net::HTTP.get_response(URI.parse(img_link))
      next unless res.code.to_f >= 200 && res.code.to_f < 400
      Photo.create(picture: URI.parse(img_link), product: new_product)
    end

    details.each do |detail|
      next if detail.blank?
      save_product_item(detail, new_product)
    end
  end

  def save_product_item(detail, product)
    code        = detail['code']
    description = detail['description']
    color       = detail['color']
    size        = detail['size']
    unit        = detail['unit']

    ProductItem.create(code: code, description: description, color: color, size: size,
                        unit: unit, product: product)
  end
end
