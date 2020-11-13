require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
content = JSON.parse(open(url).read)

Ingredient.destroy_all

content['drinks'].each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end
