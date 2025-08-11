# frozen_string_literal: true

module PricingOption
  class DiscountMinFixed < ApplicationService
    def initialize(params)
      @product = params[:product]
      @quantity = params[:quantity]
      @min_quantity = params[:min_quantity]
      @discount_price_cents = params[:discount_price_cents]
    end

    def call
      if @quantity >= @min_quantity
        @discount_price_cents * @quantity
      else
        @product.price_cents * @quantity
      end
    end
  end
end