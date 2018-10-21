# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..50).each do |x|
	Product.create(name: "product"+x.to_s, price: 1*x , image: "http://res.cloudinary.com/dhzgmlrs5/image/upload/c_fit,h_300,w_300/v1539211444/nhhbimkrsfur72hhlrtr.jpg")
end
