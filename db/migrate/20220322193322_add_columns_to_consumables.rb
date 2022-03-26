class AddColumnsToConsumables < ActiveRecord::Migration[6.1]
  def change
    add_column :consumables, :product_barcode, :integer
    add_column :consumables, :product_name, :string
    add_column :consumables, :product_image, :string
    add_column :consumables, :product_brand, :string
  end
end
