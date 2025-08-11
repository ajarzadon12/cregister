class AddPricingOptionToProduct < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :pricing_option, :string
  end
end
