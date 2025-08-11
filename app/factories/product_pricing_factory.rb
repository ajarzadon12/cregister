# frozen_string_literal: true

class ProductPricingFactory
  def self.get_subtotal(product:, quantity:)
    params = {
      product: product,
      quantity: quantity
    }

    case product.pricing_option
    when 'B1G1'
      params[:buy_quantity] = 1
      params[:get_quantity] = 1
      PricingOption::BuyGet.call(params)
    when 'DM3F450'
      params[:min_quantity] = 3
      params[:discount_price_cents] = 450
      PricingOption::DiscountMinFixed.call(params)
    when 'DM3P66'
      params[:min_quantity] = 3
      params[:discount_percent] = 2/3.to_f
      PricingOption::DiscountMinPercent.call(params)
    else
      PricingOption::Standard.call(params)
    end
  end
end