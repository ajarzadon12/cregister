class ProductSerializer
  include JSONAPI::Serializer

  attributes :name, :code, :price
  attribute :price do |object|
    Money.from_cents(object.price_cents, "EUR").format
  end
end
