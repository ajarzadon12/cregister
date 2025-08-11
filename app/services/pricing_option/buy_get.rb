# frozen_string_literal: true

module PricingOption
  class BuyGet < ApplicationService
    def initialize(params)
      @product = params[:product]
      @quantity = params[:quantity]
      @buy_quantity = params[:buy_quantity]
      @get_quantity = params[:get_quantity]
    end

    def call
      factor =  @buy_quantity / (@buy_quantity + @get_quantity).to_f
      @product.price_cents * (@quantity * factor).ceil
    end
  end
end