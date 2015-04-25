require "faker"

User.delete_all
RegistratedApplication.delete_all
Event.delete_all

# Create Users
10.times do
  user = User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(8,20)
    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Registrated Applications

20.times do 
  app = RegistratedApplication.new(
    user: users.sample,
    name: Faker::Lorem.word,
    url: Faker::Internet.url
    )
  app.save!
end

apps = RegistratedApplication.all

# Create Events

40.times do 
  event = Event.new(
    registrated_application: apps.sample,
    name: Faker::Lorem.word
    )
  event.save!
end

puts "Seeds Finished"
puts "#{User.count} Users created"
puts "#{RegistratedApplication.count} Apps created"
puts "#{Event.count} Events created"
