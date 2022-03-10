class AddReferencesToConsumables < ActiveRecord::Migration[6.1]
  def change
    add_reference :consumables, :user, foreign_key: true
    add_reference :consumables, :product, foreign_key: true
  end
end
