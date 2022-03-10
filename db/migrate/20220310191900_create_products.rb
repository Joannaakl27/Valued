class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :quantity
      t.string :barcode
      t.string :category
      t.float :ecoscore
      t.float :emission
      t.text :image
      t.float :agriculture_impact
      t.float :processing_impact
      t.float :packaging_impact
      t.float :transportation_impact
      t.float :distribution_impact
      t.float :consumption_impact

      t.timestamps
    end
  end
end
