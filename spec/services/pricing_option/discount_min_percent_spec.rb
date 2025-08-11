require 'rails_helper'

RSpec.describe PricingOption::DiscountMinPercent do
  describe '#call' do
    let(:discount_percent) { 0.8 }
    let(:min_quantity) { 3 }
    let(:product) { create(:product, price_cents: 1000) }

    subject { PricingOption::DiscountMinPercent.call(params) }

    describe 'when quantity is below minimum threshold' do
      let(:quantity) { 2 }

      let(:params) do
        {
          discount_percent: discount_percent,
          min_quantity: min_quantity,
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(2000) }
    end

    describe 'when quantity is same as minimum threshold' do
      let(:quantity) { 3 }

      let(:params) do
        {
          discount_percent: discount_percent,
          min_quantity: min_quantity,
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(2400) }
    end

    describe 'when quantity is above minimum threshold' do
      let(:quantity) { 5 }

      let(:params) do
        {
          discount_percent: discount_percent,
          min_quantity: min_quantity,
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(4000) }
    end
  end
end