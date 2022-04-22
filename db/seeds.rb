# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teams = []
teams.push(Team.create(name: 'HR'))
teams.push(Team.create(name: 'IT'))
teams.push(Team.create(name: 'SUPPORT'))

10.times do |i|
  teams.shuffle.each{|x|}
  e = Employee.new(first_name: 'Test', last_name: "user#{i}", email: "testuser#{i}@test.com")
  e.teams << teams.sample
  e.teams << teams.sample
  e.save
end

10.times do |i|
  Restaurant.create(name: "Restaurant#{i}", address: "Dummy Address#{i}")
end