# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Tournament.all.empty?
  Tournament.create(name: "Dota 2")
  Tournament.create(name: "CS:GO")
  Tournament.create(name: "Starcraft 2")
  Tournament.create(name: "Hearthstone")
  Tournament.create(name: "World Of Tanks")
end
