# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Rails.env == 'production'
  puts 'Creating Test User...'
  User.create!(email: "test@test.com", password: "111111", first_name: "Aaron", last_name: "Rohrbacher", business_name: "", address_1: "123 Sesame St", address_2: "", city: "Beaverton", state: "OR", zip: "97078", phone_1: "1111111111", phone_2: "2222222222", use_business_name: false)
  puts 'User Created.'

  puts 'Creating Test Company...'
  user = User.find(1)
  user.companies.create!(name: 'Bloody Knife Cake Co.', address_1: '123 Sesame St', address_2: 'apt. 666', city: 'Detroit', state: 'MI', zip: '99999', phone_1: '9999999999', phone_2: '8888888888')  
  puts 'Comapny Created.'
end
