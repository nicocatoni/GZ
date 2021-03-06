# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
addresses = "Av Libertador Bernardo O'Higgins, Santiago, Región Metropolitana,
Cerro Sta. Lucia, Santiago, Región Metropolitana,
Curicó 200-58, Santiago, Región Metropolitana,
Sta Isabel 176, Santiago, Región Metropolitana,
Barrio Italia, Ñuñoa, Región Metropolitana,
Conferencia 1100-1062, Santiago, Región Metropolitana,
Juan Sabaj 121, Ñuñoa, Región Metropolitana,
Álvarez de Toledo 316, San Joaquín, Región Metropolitana,
Gran Avenida Jose Miguel Carrera 5110, San Miguel, Región Metropolitana"
AdminUser.destroy_all
User.destroy_all
Growshop.destroy_all

3.times do |i|
   User.create(
       username: Faker::Name.name,
       email: Faker::Internet.email,
       address: addresses,
       password: '123456'
   )
end





addresses = addresses.split("\n")
addresses.each do|address|
   Growshop.create!(
       name: Faker::Name.name,
       description: Faker::Cannabis.type,
       address: address,
       user: User.order('RANDOM()').first
       )
   sleep 1
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?