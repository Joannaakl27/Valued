class CreateConsumables < ActiveRecord::Migration[6.1]
  def change
    create_table :consumables do |t|
      t.integer :serving_size
      t.float :number_of_servings
      t.date :purchase_date

      t.timestamps
    end
  end
end
