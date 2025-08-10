# frozen_string_literal: true

class ProductsController < ApplicationController
  layout 'products'

  before_action :session_cart, only: %i[add_to_cart remove_from_cart]

  def index
    products = Product.all
    serialized_products = ProductSerializer.new(products, is_collection: true).serializable_hash
    @products_props = { products: serialized_products, cart: session_cart }
  end

  def add_to_cart
    @cart[params[:product_code]] = @cart[params[:product_code]].to_i + 1
    session[:cart] = @cart

    render json: { cart: @cart }
  end

  def remove_from_cart
    if @cart[params[:product_code]].to_i > 1
      @cart[params[:product_code]] = @cart[params[:product_code]].to_i - 1
    else
      @cart.delete(params[:product_code])
    end
    session[:cart] = @cart

    render json: { cart: @cart }
  end

  private

  def session_cart
    @cart = session[:cart].clone || {}
  end
end
