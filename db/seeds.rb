# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
require 'nokogiri'

puts 'Cleaning database...'
Cocktail.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
html_file = open(url).read
ingredients = JSON.parse(html_file)
  ingredients["drinks"].each do |d|
    i = Ingredient.create(name: d["strIngredient1"])
    puts "created... #{i.name}"
  end

puts 'Finished!'
