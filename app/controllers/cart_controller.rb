# frozen_string_literal: true

class CartController < ApplicationController
  layout 'products'

  def show
    products = Product.where(code: session[:cart].keys)
    options = {
      params: {
        cart: session[:cart] || {}
      },
      is_collection: true
    }
    cart = CartProductSerializer.new(products, options)
    total = cart.as_json['data'].pluck('attributes').sum { |i| i['subtotal'].gsub(/[^0-9]/, '').to_f }

    @cart_props = { cart: cart.serializable_hash, total: Money.from_cents(total, 'EUR').format }
  end
end