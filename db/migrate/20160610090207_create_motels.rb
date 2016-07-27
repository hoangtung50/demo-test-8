class CreateMotels < ActiveRecord::Migration
  def change
    create_table :motels do |t|
      t.string :title
      t.decimal :price, precision: 10, scale: 1, default: 0
      t.decimal :acreage, precision: 10, scale: 1, default: 0
      t.text :description
      t.references :area, index: true

      t.timestamps null: false
    end
  end
end
