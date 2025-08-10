class CartProductSerializer
  include JSONAPI::Serializer

  attributes :name, :code
  attribute :unit_price do |object|
    Money.from_cents(object.price_cents, "EUR").format
  end
  attribute :quantity do |object, params|
    params[:cart][object.code]
  end
  attribute :subtotal do |object, params|
    # add computation of discount here
    price = object.price_cents * params[:cart][object.code].to_i
    Money.from_cents(price, "EUR").format
  end
end
