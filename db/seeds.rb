# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = 'mike@arlenmusic.com'
user.password = '8888michael'
user.save!

b = Band.new
b.name = "Velocity"
b.band_leader = "Erik Martinez"
b.save!

b = Band.new
b.name = "Entourage"
b.band_leader = "Leslie Hunt"
b.save!

b = Band.new
b.name = "Front of House"
b.band_leader = "David Sherman"
b.save!

b = Band.new
b.name = "Indigo"
b.band_leader = "Dan Nicholson"
b.save!


b = Band.new
b.name = "Ken Arlen Evolution Orchestra(Caitlin Simone)"
b.band_leader = "Caitlin Simone"
b.save!

b = Band.new
b.name = "Ken Arlen Evolution Orchestra(Ken Arlen)"
b.band_leader = "Ken Arlen"
b.save!

b = Searchable.new
b.name = "Velocity"
b.save!

b = Searchable.new
b.name = "Entourage"
b.save!

b = Searchable.new
b.name = "Front of House"
b.save!

b = Searchable.new
b.name = "Indigo"
b.save!

b = Searchable.new
b.name = "Ken Arlen Evolution Orchestra"
b.save!


