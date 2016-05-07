class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
			t.string :name
    	t.string :sku
    	t.float :price
    	t.references :brand, index: true
    	t.attachment :picture

    	t.timestamps null: false
    end
  end
end
