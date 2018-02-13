# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Item.create(
    title: "Rosewood Washing Cup", 
    inventory: 6, 
    price: 70
  )
  
  Item.create(
    title: "Guapinol Washing Cup", 
    inventory: 6, 
    price: 70
  )
  
  Category.create(title: "Washing Cups")
  Category.create(title: "Kiddush Cups")
  Category.create(title: "Challah Boards")
  Category.create(title: "Tzedakah Boxes")
  Category.create(title: "Gifts For The Home")