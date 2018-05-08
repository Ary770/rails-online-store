# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Item : Name, Inventory, Price, description, CategoryName
create_items = [
  ["Super Smart Phone", 4, 600, "Lorem ipsum dolor amet adaptogen sunt sartorial elit, pabst labore prism man bun kitsch master cleanse. Do nisi migas, anim meggings sustainable consectetur. Food truck meditation air plant narwhal forage keytar.", "Tech Gadgets"], ['YouWatch', 10, 300, "Retro helvetica cray craft beer laborum. Art party franzen duis, kitsch selfies irony mixtape edison bulb ut in readymade freegan health goth selvage godard.", "Tech Gadgets"], ['Vintage Water Bottle', 7, 69, "Water street art non messenger bag paleo reprehenderit.", "Essentials"], ['Cool Backpack', 12, 49, "Tote bag af aliquip lorem etsy, squid taxidermy fugiat deserunt. Chambray tilde mlkshk, echo park labore do woke adaptogen cupidatat. Excepteur ullamco ipsum cold-pressed poke bicycle rights prism butcher raclette tumeric kogi hoodie succulents.", "Outdoor"]
]

create_items2 = [
  ['Esspreso Express', 4, 98, "Street art succulents copper mug, vape franzen hammock brooklyn 3 wolf moon deserunt enamel pin occaecat cronut keytar. ", "Outdoor"], ['Magic Coffee', 6, 40, "Ohhhh, fixie freegan knausgaard master cleanse 8-bit banh mi, poke 3 wolf moon leggings slow-carb sustainable keytar.", "Goodies"], ['Hipter Glasses', 20, 120, "Aute quis raw denim, quinoa adipisicing cupidatat keffiyeh franzen pug trust fund.", "Essentials"], ['Special Kosher Candy', 15, 10, "Distillery cillum crucifix irony chillwave reprehenderit keytar ugh gastropub.", "Goodies"]
]

# country_list.each do |country|
#   Country.create( :name => country[0], :population => country[1] )
# end

create_items.each do |item|
  Item.create(name: item[0], inventory: item[1], price: item[2], description: item[3], category: Category.find_or_create_by(name: item[4]))
end

create_items2.each do |item|
  Item.create(name: item[0], inventory: item[1], price: item[2], description: item[3], category: Category.find_or_create_by(name: item[4]))
end
