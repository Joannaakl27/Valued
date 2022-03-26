class ChangeBarcodeType < ActiveRecord::Migration[6.1]
  def change
    change_column :consumables, :product_barcode, :string
  end
end
