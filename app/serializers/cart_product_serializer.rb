class CartProductSerializer
  include JSONAPI::Serializer

  attributes :name, :code, :unit_price, :quantity , :subtotal
end
