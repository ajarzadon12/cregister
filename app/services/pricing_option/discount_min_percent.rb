# frozen_string_literal: true

module PricingOption
  class DiscountMinPercent < ApplicationService
    def initialize(params)
      @product = params[:product]
      @quantity = params[:quantity]
      @min_quantity = params[:min_quantity]
      @discount_percent = params[:discount_percent]
    end

    def call
      if @quantity >= @min_quantity
        (@product.price_cents * @discount_percent.to_f * @quantity).to_i
      else
        @product.price_cents * @quantity
      end
    end
  end
end