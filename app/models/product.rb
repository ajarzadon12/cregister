class Product < ApplicationRecord
  validates :name, :code, :price_cents, presence: true
end
