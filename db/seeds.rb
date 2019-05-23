# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
	User.create(first_name: "#{i} first", last_name: "#{i} last") 
end

3.times do |i|
	Doctor.create(name: "Dr. #{i}")
end


Appointment.create(course_id: Doctor.first.id, user_id: User.first.id, apt: "Sick Visit")
Appointment.create(course_id: Doctor.last.id, user_id: User.first.id, apt: "Annual")