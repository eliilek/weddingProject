# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = 'sstrausman@gmail.com'
user.password = 'password'
user.save!

a = Band.new
a.name = "Ken Arlen Evolution Orchestra"
a.band_leader = "Caitlin Simone"
a.save!

b = Band.new
b.name = "Ken Arlen Evolution Orchestra"
b.band_leader = "Ken Arlen"
b.save!

c = Band.new
c.name = "Front of House"
c.band_leader = "David Sherman"
c.save!

d = Band.new
d.name = "Indigo"
d.band_leader = "Dan Nicholson"
d.save!

e = Band.new
e.name = "Entourage"
e.band_leader = "Leslie Hunt"
e.save!

f = Band.new
f.name = "Velocity"
f.band_leader = "Erik Martinez"
f.save!

event = Event.new
event.client_first_name = "Shea"
event.client_last_name = "Strausman"
event.planning_date = "Tommorow"
event.final_date = ""
event.job_identification_number = 5001
event.status = "FIRST CONTACT"
event.primary_contact = "Jesse Reynolds"
event.secondary_contact = "Shea Strausman"
event.primary_contact_phone = "111-222-3333"
event.secondary_contact_phone = '222-333-444'
event.primary_contact_email = "jesse@kleintech.com"
event.secondary_contact_email = "sstrausman@gmail.com"
event.guests = 150
event.save!

e = Event.new
e.client_first_name = "Eli"
e.client_last_name = "Klein"
e.planning_date = "Sometime"
e.final_date = ""
e.job_identification_number = 5002
e.status = "FIRST CONTACT"
e.primary_contact = "Jesse Reynolds"
e.secondary_contact = "Shea Strausman"
e.primary_contact_phone = "111-222-3333"
e.secondary_contact_phone = '222-333-444'
e.primary_contact_email = "jesse@kleintech.com"
e.secondary_contact_email = "sstrausman@gmail.com"
e.guests = 150
e.save!
e.record_timestamps = false
e.updated_at = 10.days.ago
