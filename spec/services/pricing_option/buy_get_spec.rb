require 'rails_helper'

RSpec.describe PricingOption::BuyGet do
  describe '#call' do
    let(:buy_quantity) { 1 }
    let(:get_quantity) { 1 }

    subject { PricingOption::BuyGet.call(params) }

    describe 'buy 1 get 1 when quantity is even' do
      let(:product) { create(:product, price_cents: 1000) }
      let(:quantity) { 4 }

      let(:params) do
        {
          buy_quantity: buy_quantity,
          get_quantity: get_quantity,
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(2000) }
    end

    describe 'buy 1 get 1 when quantity is odd' do
      let(:product) { create(:product, price_cents: 500) }
      let(:quantity) { 5 }

      let(:params) do
        {
          buy_quantity: buy_quantity,
          get_quantity: get_quantity,
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(1500) }
    end
  end
end