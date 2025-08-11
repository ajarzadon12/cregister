require 'rails_helper'

RSpec.describe PricingOption::Standard do
  describe '#call' do
    subject { PricingOption::Standard.call(params) }

    describe 'when given product and quantity' do
      let(:product) { create(:product, price_cents: 1000) }
      let(:quantity) { 5 }

      let(:params) do
        {
          product: product,
          quantity: quantity
        }
      end

      it { expect(subject).to eq(5000) }
    end
  end
end