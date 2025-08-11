# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create(name: 'Green Tea', code: 'GR1', price_cents: 311, pricing_option: 'B1G1')
Product.create(name: 'Strawberries', code: 'SR1', price_cents: 500, pricing_option: 'DM3F450')
Product.create(name: 'Coffee', code: 'CF1', price_cents: 1123, pricing_option: 'DM3P66')