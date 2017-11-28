# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'
#require 'faker'

10.times do
  User.create!(
    :email    => Faker::Internet.email,
    :password     => Faker::Internet.password
  )
end

users = User.all

puts "#{User.count} users created"

5.times do
wiki = Wiki.create!(
   user:         users.sample,
  :title        => Faker::LordOfTheRings.location,
  :body         => Faker::Lorem.paragraphs(1),
  private:      false
)
end



puts "#{Wiki.count} wikis created"
puts "Seed finished"
