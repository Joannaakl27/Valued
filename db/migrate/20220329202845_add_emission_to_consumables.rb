class AddEmissionToConsumables < ActiveRecord::Migration[6.1]
  def change
    add_column :consumables, :emission, :float
  end
end
