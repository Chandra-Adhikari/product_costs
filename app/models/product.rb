class Product < ApplicationRecord
	def self.rate_conversion
		ip = request.ip
		country_code = Geocoder.search('172.17.0.1').first.country
		country_details = ISO3166::Country[country_code]
		currency = country_details.currency
		@rates = ActiveSupport::JSON.decode(`curl -X GET --header 'Accept:application/json; charset=utf-8' --header 'Content-Type:application/json; charset=utf-8' http://data.fixer.io/api/latest?%20access_key=875445857d892879bab80b04f45a0df5`)

		p rate = @rates["rates"][currency.iso_code]
		@prices = Product.converted_rate(rate,currency)
	end

	def self.converted_rate(rate,currency)
		products = Product.all
		@products = []
		products.each do |product|
			@product ={}
			@product[:name] = product.name
			@product[:price] = (product.price.to_f * rate).round(2)
			@product[:image] = product.image
			@product[:symbol] = currency.symbol
			@products.push(@product)
		end
		@products
	end
end
