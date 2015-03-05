namespace :db do
	desc "fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'
		require "acts_as_follower"

		[User, Restaurant].each(&:delete_all)

		User.populate(500) do |user|
			user.fname = Faker::Name.first_name
			user.lname = Faker::Name.last_name
			user.bio = Faker::Lorem.paragraph
			user.email = Faker::PhoneNumber.phone_number
			user.password = Faker::Internet.password
			user.longitude = Faker::Address.longitude
			user.latitude = Faker::Address.latitude
			user.gender = ['Male', 'Female']
			user.address = Faker::Address.street_address
			user.preference = ['Male', 'Female']
			avatar_file_name = "missing.png"
		end

		Restaurant.populate(100..250) do |restaurant|
			restaurant.name = Faker::Company.name
		end

		users = User.all
		restaurants = Restaurant.all
		users.each do |user|
			(rand(5..25)).times do 
				user.follow(restaurants.sample)
			end
		end
	end
end
