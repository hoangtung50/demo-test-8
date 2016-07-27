require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

class Crawler
  def thuenhasg
    get_data
  end

  def get_data
    url  = 'http://thuenhasg.com'
    doc  = Nokogiri::HTML(open(url))

    doc.css(".menu_chinh li").each do |category|
      url_category = category.at_css('a')[:href]
      title = category.at_css('a').text
      p url_category
      p title
      p "save ====="

      area = Area.find_or_create_by(name: title)

      next if title == 'Xem thêm'

      get_items(url_category, area)
    end
  end

  def get_items(url_category, area)
    doc  = Nokogiri::HTML(open(url_category))

    doc.css(".box_tinrao").each do |item|
      url_item = item.at_css('.tit_tinrao h3 a')[:href]
      get_item(url_item, area)
    end
  end

  def get_item(url_item, area)

    p url_item

    doc  = Nokogiri::HTML(open(url_item))

    mota_ngan = doc.css('.mota_ngan li span')

    area.motels.create_with(price: mota_ngan[0].text, acreage: mota_ngan[1].text, description: doc.at_css('.thongtin_chitiet p').inner_html).find_or_create_by(title: doc.at_css('.tiude_tin').text)
        
    p "save #{area.motels.count}"
    # item[:images] = []
    # doc.css('.amazingslider-slides li span').each do |image|
    #   item[:images] << image[:href]
    # end
  end
  
  def save_data(data)
    p 'save ==============='
    data.each do |category|
      next if category.blank?
      area = Area.find_or_create_by(name: category['category_title'])
      p area.name
      category['subs'].each do |motel|
        m = area.motels.create_with(price: motel[:gia], acreage: motel[:dientich], description: motel[:chitiet]).find_or_create_by(title: motel[:title])
        p m.title      
      end
    end
  end
end
