# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = 'sstrausman@gmail.com'
user.password = 'password'
user.save!

a = Band.new
a.name = "Ken Arlen Evolution Orchestra(Caitlin Simone)"
a.band_leader = "Caitlin Simone"
a.save!

b = Band.new
b.name = "Ken Arlen Evolution Orchestra(Ken Arlen)"
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

counter = 5004 
20.times do
	e = Event.new
	e.client_first_name = Faker::Name.first_name
	e.client_last_name = Faker::Name.last_name
	e.planning_date = "Some date"
	e.final_date = Faker::Date.forward(23)
	e.job_identification_number = counter
	e.status = ["FIRST CONTACT","CALLED BACK", "PROPOSAL GENERATED","SALES MEETING SCHEDULED", "CONTRACT GENERATED", "RELEASED", "RELEASED-BAB", "RELEASED-BADJ"].sample
	e.primary_contact = Faker::Name.name
	e.secondary_contact = Faker::Name.name
	e.primary_contact_phone = Faker::PhoneNumber.phone_number
	e.secondary_contact_phone = Faker::PhoneNumber.phone_number
	e.primary_contact_email = Faker::Internet.email
	e.secondary_contact_email = Faker::Internet.email
	e.guests = rand(1..1000)
	e.save!
	counter += 1
end

20.times do
	e = Event.new
	e.client_first_name = Faker::Name.first_name
	e.client_last_name = Faker::Name.last_name
	e.planning_date = "Some Other Date"
	e.final_date = ""
	e.job_identification_number = counter
	e.status = ["FIRST CONTACT","CALLED BACK", "PROPOSAL GENERATED","SALES MEETING SCHEDULED", "CONTRACT GENERATED", "RELEASED", "RELEASED-BAB", "RELEASED-BADJ"].sample
	e.primary_contact = Faker::Name.name
	e.secondary_contact = Faker::Name.name
	e.primary_contact_phone = Faker::PhoneNumber.phone_number
	e.secondary_contact_phone = Faker::PhoneNumber.phone_number
	e.primary_contact_email = Faker::Internet.email
	e.secondary_contact_email = Faker::Internet.email
	e.guests = rand(1..1000)
	e.save!
	counter += 1
end

5.times do
	n = Notification.new
	n.name = Faker::Lorem.sentence
	n.notification_date = Faker::Date.forward(23)
	n.event_id = rand(1..40)
	n.save
end

2.times do
	n = Notification.new
	n.name = Faker::Lorem.sentence
	n.notification_date = Date.today
	n.event_id = rand(1..40)
	n.save
end




45.times do 
	b = Contact.new
	b.event_id = rand(1..40)
	b.notes = Faker::Lorem.sentence
	b.date = Faker::Date.backward(23)
end