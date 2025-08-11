# frozen_string_literal: true

class CartController < ApplicationController
  layout 'products'

  def show
    cart = CartService.call(cart: session[:cart])
    serialized_cart = CartSerializer.new(cart).serializable_hash

    @cart_props = { cart: serialized_cart }
  end
end