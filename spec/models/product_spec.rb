require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validates presence of name' do
    let(:product) { build(:product, name: nil) }

    it { expect(product).not_to be_valid }
  end

  describe 'validates presence of code' do
    let(:product) { build(:product, code: nil) }

    it { expect(product).not_to be_valid }
  end

  describe 'validates presence of price_cents' do
    let(:product) { build(:product, price_cents: nil) }

    it { expect(product).not_to be_valid }
  end
end
