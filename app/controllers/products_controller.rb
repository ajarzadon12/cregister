# frozen_string_literal: true

class ProductsController < ApplicationController
  layout 'products'

  def index
    products = Product.all
    serialized_products = ProductSerializer.new(products, is_collection: true).serializable_hash
    @products_props = { products: serialized_products }
  end
end
