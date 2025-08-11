# frozen_string_literal: true

module PricingOption
  class Standard < ApplicationService
    def initialize(params)
      @product = params[:product]
      @quantity = params[:quantity]
    end

    def call
      @product.price_cents * @quantity
    end
  end
end