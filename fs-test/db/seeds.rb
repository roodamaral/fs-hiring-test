# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'json'
@user1 = User.create(name:'John Doe', email:'john@doe.com', password:'password', password_confirmation:'password')
@user2 = User.create(name:'John Day', email:'john@day.com', password:'password', password_confirmation:'password')

url = 'https://luvotels-hiring-api.herokuapp.com/motels.json'

response = JSON.load(open(url))

response.each do |response|
	Motel.create(id: response['id'], name: response['name'], logo: response['logo'])
	puts "Motel Created!"
end

url2 = 'https://luvotels-hiring-api.herokuapp.com/motels/24/rooms.json'

response2 = JSON.load(open(url2))

response2.each do |response|
	Room.create(id:response['id'], motel_id:response['motel_id'], name:response['name'], picture:response['picture'])
	puts 'Room Created'
end

url3 = 'https://luvotels-hiring-api.herokuapp.com/motels/42/rooms.json'

response3 = JSON.load(open(url3))

response3.each do |response|
	Room.create(id:response['id'], motel_id:response['motel_id'], name:response['name'], picture:response['picture'])
	puts 'Room Created'
end

url4 = 'https://luvotels-hiring-api.herokuapp.com/motels/200/rooms.json'

response4 = JSON.load(open(url4))

response4.each do |response|
	Room.create(id:response['id'], motel_id:response['motel_id'], name:response['name'], picture:response['picture'])
	puts 'Room Created'
end

url5 = 'https://luvotels-hiring-api.herokuapp.com/motels/24/bookings.json'

response5 = JSON.load(open(url5))

response5.each do |response|
	Booking.create(id:response['id'], motel_id:response['motel_id'], room_id:response['room_id'], amount_centavos:response['amount_centavos'], fee_percentage:response['fee_percentage'], booking_period:response['booking_period'], paid_at:response['paid_at'], booking_code:response['booking_code'])
	puts "Booking Created!"
end

url6 = 'https://luvotels-hiring-api.herokuapp.com/motels/42/bookings.json'

response6 = JSON.load(open(url6))

response6.each do |response|
	Booking.create(id:response['id'], motel_id:response['motel_id'], room_id:response['room_id'], amount_centavos:response['amount_centavos'], fee_percentage:response['fee_percentage'], booking_period:response['booking_period'], paid_at:response['paid_at'], booking_code:response['booking_code'])
	puts "Booking Created!..."
end

url7 = 'https://luvotels-hiring-api.herokuapp.com/motels/200/bookings.json'

response7 = JSON.load(open(url7))

response7.each do |response|
	Booking.create(id:response['id'], motel_id:response['motel_id'], room_id:response['room_id'], amount_centavos:response['amount_centavos'], fee_percentage:response['fee_percentage'], booking_period:response['booking_period'], paid_at:response['paid_at'], booking_code:response['booking_code'])
	puts "Booking Created!"
end
puts @user1.id
puts "Hello hello"
motel1 = Motel.find(24)

motel1.update(user_id: 1)
puts "Added User for motel"
motel2 = Motel.find(42)

motel2.update(user_id: 1)
puts "Added User for motel2"
motel3 = Motel.find(200)

motel3.update(user_id: 2)
puts "Added User for motel3"

puts "Created Motels, Users and Bookings"