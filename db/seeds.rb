# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Datos por defecto, en Users


#Datos por defecto, en Categories TypeCategory

TypeCategory.create! do |t|
  t.name = 'Ciencia Ficción'
  t.public = 1
end

TypeCategory.create! do |t|
  t.name = 'Aventura'
  t.public = 0
end

TypeCategory.create! do |t|
  t.name = 'Terror'
  t.public = 1
end

TypeCategory.create! do |t|
  t.name = 'Comedia'
  t.public = 1
end

TypeCategory.create! do |t|
  t.name = 'Drama'
  t.public = 1
end
