FactoryBot.define do
  factory :product do
    name { 'MyString' }
    code { 'MyString' }
    price_cents { 1 }
    pricing_option { 'MyString' }
  end
end
