class CartSerializer
  include JSONAPI::Serializer

  attribute :cart_products, serializer: CartProductSerializer

  attributes :total_price
end
