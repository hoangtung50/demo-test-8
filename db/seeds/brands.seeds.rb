puts "==== Create Brands ===="
Brand.destroy_all
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE brands_id_seq RESTART WITH 1"
)

Brand.create({ name: 'Nike'})
Brand.create({ name: 'Puma'})
Brand.create({ name: 'Adidas'})
Brand.create({ name: 'Fila'})
puts "==== End ===="