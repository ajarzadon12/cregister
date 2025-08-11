require 'rails_helper'
require 'active_support/core_ext/hash/indifferent_access'

RSpec.describe CartService do
  describe '#call' do
    let!(:product1) { create(:product, name: 'Green Tea', code: 'GR1', price_cents: 311, pricing_option: 'B1G1') }
    let!(:product2) { create(:product, name: 'Strawberries', code: 'SR1', price_cents: 500, pricing_option: 'DM3F450') }
    let!(:product3) { create(:product, name: 'Coffee', code: 'CF1', price_cents: 1123, pricing_option: 'DM3P66') }

    subject { CartService.call(cart: cart) }

    describe 'when cart items are GR1,SR1,GR1,GR1,CF1' do
      let(:cart) do
        {
          'GR1': 3,
          'SR1': 1,
          'CF1': 1
        }.with_indifferent_access
      end
      let(:expected_total_price) { Money.from_cents(2245, 'EUR').format }

      it { expect(subject.total_price).to eq(expected_total_price) }

      it { expect(subject.cart_products.count).to eq(cart.keys.count) }
    end

    describe 'when cart items are GR1,GR1' do
      let(:cart) do
        {
          'GR1': 2
        }.with_indifferent_access
      end
      let(:expected_total_price) { Money.from_cents(311, 'EUR').format }

      it { expect(subject.total_price).to eq(expected_total_price) }

      it { expect(subject.cart_products.count).to eq(cart.keys.count) }
    end

    describe 'when cart items are SR1,SR1,GR1,SR1' do
      let(:cart) do
        {
          'SR1': 3,
          'GR1': 1
        }.with_indifferent_access
      end
      let(:expected_total_price) { Money.from_cents(1661, 'EUR').format }

      it { expect(subject.total_price).to eq(expected_total_price) }

      it { expect(subject.cart_products.count).to eq(cart.keys.count) }
    end

    describe 'when cart items are GR1,CF1,SR1,CF1,CF1' do
      let(:cart) do
        {
          'GR1': 1,
          'CF1': 3,
          'SR1': 1,
        }.with_indifferent_access
      end
      let(:expected_total_price) { Money.from_cents(3057, 'EUR').format }

      it { expect(subject.total_price).to eq(expected_total_price) }

      it { expect(subject.cart_products.count).to eq(cart.keys.count) }
    end
  end
end