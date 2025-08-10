class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.integer :price_cents

      t.timestamps
    end
  end
end
