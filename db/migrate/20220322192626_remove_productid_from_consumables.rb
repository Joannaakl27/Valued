class RemoveProductidFromConsumables < ActiveRecord::Migration[6.1]
  def change
    remove_reference :consumables, :product, foreign_key: true, index: false
  end
end
