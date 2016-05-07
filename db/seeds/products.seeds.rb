after :brands do  
	puts "==== Create Products ===="
	Product.destroy_all
	ActiveRecord::Base.connection.execute(
	  "ALTER SEQUENCE products_id_seq RESTART WITH 1"
	)

	Brand.all.each do |brand|
		brand.products.create!([
			{name: 'product 1', sku: '001_'+ brand.id.to_s, price: 200},
			{name: 'product 2', sku: '002_'+ brand.id.to_s, price: 400},
			{name: 'product 3', sku: '003_'+ brand.id.to_s, price: 600}
			]
		)
	end
	
	puts "==== End ===="
end