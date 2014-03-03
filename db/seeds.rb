# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_snap = Snap.new(description: "Our first snap")
first_snap.image = File.open('/Users/Abraham/Desktop/snappygram-images/first_snap.jpg')
first_snap.save