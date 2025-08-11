# frozen_string_literal: true

class CartService < ApplicationService
  Cart = Struct.new(:id, :cart_products, :total_price)
  CartProduct = Struct.new(:id, :name, :code, :unit_price, :quantity, :subtotal_raw, :subtotal)

  def initialize(cart:)
    @cart = cart
    @products = Product.where(code: cart.keys)
  end

  def call
    Cart.new(SecureRandom.uuid, cart_products, total_price)
  end

  private

  def cart_products
    @cart_products ||=
      @products.map do |product|
        quantity = @cart[product.code].to_i
        unit_price = Money.from_cents(product.price_cents, "EUR").format
        subtotal_raw = calculate_subtotal(product, quantity)
        subtotal = Money.from_cents(subtotal_raw, "EUR").format

        CartProduct.new(SecureRandom.uuid, product.name, product.code, unit_price, quantity, subtotal_raw, subtotal)
      end
  end

  def calculate_subtotal(product, quantity)
    ProductPricingFactory.get_subtotal(product: product, quantity: quantity)
  end

  def total_price
    total = cart_products.sum { |product| product.subtotal_raw }
    Money.from_cents(total, "EUR").format
  end
end