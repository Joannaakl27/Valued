class Product < ApplicationRecord
  has_many :consumables, dependent: :destroy

  validates :name, :quanity, :barcode, :category, :emission, presence: true
end
