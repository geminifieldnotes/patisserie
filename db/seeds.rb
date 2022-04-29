# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'


CoffeeFlavorProfile.delete_all
Coffee.delete_all
Bean.delete_all
CoffeeType.delete_all
Pastry.delete_all
FlavorProfile.delete_all

# Webscraped Primary Coffee Beans
beans = []
CSV.new(open('./db/coffeeBeanTypes.csv'), :headers => :false).each do |row|
  beans.push(row.to_hash)
end

beans.each do |bean|
  Bean.create(
    name: bean[bean.keys[0]],
    description: bean[bean.keys[1]]
  )
end

Bean.create(
  name: 'No Coffee Bean',
  description: 'Some beverages we offer do not require coffee beans.'
)


# Coffee Types - Manual creation
CoffeeType.create(
  name: 'Black Coffee',
  description: 'Coffee in its simplest form. The coffee beans are picked, roasted and prepared then ground. The coffee grounds are brewed in your choice of machines (or through the pour over method). Once you do this, the coffee that is left in your cup is all there is.'
)

CoffeeType.create(
  name: 'Espresso',
  description: 'Similar to black coffee in that the beans are picked, roasted and prepared then ground but into a much finer grind and then ‘pulled’ to create a very strong, potent, and more flavorful coffee drink rather than the slightly milder flavor of the black coffee.'
)

CoffeeType.create(
  name: 'Milk-based Beverage',
  description: 'Drinks which are always made with milk. Adding specific amounts or types of milk to your coffee or tea can create an entirely different flavor profile.'
)

CoffeeType.create(
  name: 'Tea',
  description: 'A very palatable beverage beloved for its variety of tastes. A great cup of tea is about gathering great tea leaves, crafting tea blends, and steeping with traditional tea-brewing techniques.'
)

# Flavor Profiles for Menu Items

flavors = ['Nutty', 'Citrusy', 'Spiced', 'Roasted', 'Herbal', 'Sour/Fermented', 'Fruity', 'Vanilla', 'Bitter', 'Sweetened', 'Floral', 'Chocolate', 'Umami', 'Spicy', 'Salty', 'Minty']
flavors.each do |flavor|
  FlavorProfile.create(name:flavor)
end

nutty = FlavorProfile.find_by(name: 'Nutty')
citrusy = FlavorProfile.find_by(name: 'Citrusy')
spiced = FlavorProfile.find_by(name: 'Spiced')
roasted = FlavorProfile.find_by(name: 'Roasted')
herbal = FlavorProfile.find_by(name: 'Herbal')
fruity = FlavorProfile.find_by(name: 'Fruity')
vanilla = FlavorProfile.find_by(name: 'Vanilla')
bitter = FlavorProfile.find_by(name: 'Bitter')
floral = FlavorProfile.find_by(name: 'Floral')
sweetened = FlavorProfile.find_by(name: 'Sweetened')
chocolate = FlavorProfile.find_by(name: 'Chocolate')
minty = FlavorProfile.find_by(name: 'Minty')

# Webscraped Coffee Drinks
CSV.new(open('./db/coffees.csv'), :headers => :false).each do |row|
  coffees_data = row.to_hash
  names = coffees_data[coffees_data.keys[0]].tr('[]', '').split(",")
  descriptions = coffees_data[coffees_data.keys[1]].tr('[]', '').split(" , ")

  names.each_with_index do |coffee, index|
    desc = descriptions[index].tr('{"}', '').split(":")[1]
    Coffee.create(
      name: coffee.tr('{""}', '').split(":")[1],
      description: desc,
      price: 6.45,
      bean_id: Bean.find_by('name LIKE "Arabica%"').id,
      coffee_type_id: desc.include?("milk") ? CoffeeType.find_by(name: 'Milk-based Beverage').id : CoffeeType.find_by(name: 'Black Coffee').id,
      flavor_profiles: desc.include?("milk") ? [vanilla, chocolate, roasted, nutty, sweetened] : [nutty, roasted, bitter, floral]
    )
  end
end

# Webscraped Commerical Coffee Drinks
CSV.new(open('./db/commercial_coffees.csv'), :headers => :false).each do |row|
  comm_coffees_data = row.to_hash
  comm_names = comm_coffees_data[comm_coffees_data.keys[0]].tr('[]', '').split(",")
  comm_descriptions = comm_coffees_data[comm_coffees_data.keys[1]].tr('[]', '').split(" , ")

  comm_names.each_with_index do |comm_coffee, index|
      comm_coffee_type = 0
      flavors = []
      comm_desc = comm_descriptions[index].tr('{"}', '').split(":")[1]

      if comm_desc.include?("tea")
        comm_coffee_type = CoffeeType.find_by(name: 'Tea').id
        flavor_profiles = [fruity, floral, herbal, minty, citrusy, spiced]
      elsif comm_desc.include?("espresso")
        comm_coffee_type =CoffeeType.find_by(name: 'Espresso').id
        flavor_profiles = [bitter, roasted, fruity, nutty, floral]
      else
        comm_coffee_type =CoffeeType.find_by(name: 'Milk-based Beverage').id
        flavor_profiles = [vanilla, chocolate, roasted, nutty, sweetened, spiced]
      end

      Coffee.create(
        name: comm_coffee.tr('{""}', '').split(":")[1],
        description: comm_desc,
        price: 4.25,
        bean_id: comm_coffee.include?("Tea") ? Bean.find_by('name LIKE "No%"').id : Bean.find_by('name LIKE "Robusta%"').id,
        coffee_type_id: comm_coffee_type,
        flavor_profiles: flavors
      )
  end
end

# Coffee Types API
coffee_type_url = URI('https://starducks-mongodb-server.herokuapp.com/coffee')

coffee_type_http = Net::HTTP.new(coffee_type_url.host, coffee_type_url.port)
coffee_type_http.use_ssl = true
coffee_type_http.verify_mode = OpenSSL::SSL::VERIFY_NONE

coffee_type_request = Net::HTTP::Get.new(coffee_type_url)
coffee_type_response = coffee_type_http.request(coffee_type_request)
third_party_types = JSON.parse(coffee_type_response.read_body)

third_party_types.each do |x|
  Coffee.create(
    name: x['title'],
    description: x['description'],
    price: 3.99,
    bean_id: Bean.find_by('name LIKE "Liberica%"').id,
    coffee_type_id: x['description'].include?("espresso") ? CoffeeType.find_by(name: 'Espresso').id : CoffeeType.find_by(name: 'Black Coffee').id
  )
end

# Unique/International Coffees - Manual creation
Coffee.create(
  name: 'Turkish Coffee',
  description: 'A rich, thick, and delightful drink to be enjoyed slowly with good company. It is brewed in a copper coffee pot called a cezve (jez-VEY), made with powder-like ground coffee, and sweetened to the drinker\'s taste.',
  price: 4.50,
  bean_id: Bean.find_by('name LIKE "Excelsa%"').id,
  coffee_type_id: CoffeeType.find_by(name: 'Black Coffee').id
)

Coffee.create(
  name: 'Turkish Iced Coffee',
  description: 'A refreshing, cold, rich, thick, and delightful drink to be enjoyed slowly with good company. It is brewed in a copper coffee pot called a cezve (jez-VEY), made with powder-like ground coffee, and sweetened to the drinker\'s taste.',
  price: 4.50,
  bean_id: Bean.find_by('name LIKE "Excelsa%"').id,
  coffee_type_id: CoffeeType.find_by(name: 'Black Coffee').id
)

Coffee.create(
  name: 'Vietnamese Coffee',
  description: 'Traditionally brewed in a phin – a small metal cup that fits over a mug or cup– and brews incredibly slowly, but makes a strong and small coffee which resembles a thicker, more caffeinated espresso.',
  price: 4.75,
  bean_id: Bean.find_by('name LIKE "Excelsa%"').id,
  coffee_type_id: CoffeeType.find_by(name: 'Black Coffee').id
)

Coffee.create(
  name: 'Bulletproof Coffee',
  description:'A high fat, low carb standard brewed coffee with coconut oil and unsalted butter',
  price: 5.99,
  bean_id: Bean.find_by('name LIKE "Excelsa%"').id,
  coffee_type_id: CoffeeType.find_by(name: 'Black Coffee').id
)

# Webscraped Pastries
CSV.new(open('./db/pastries.csv'), :headers => :false).each do |row|
  pastries_data = row.to_hash
  names = pastries_data[pastries_data.keys[0]].tr('[]', '').split(",")
  descriptions = pastries_data[pastries_data.keys[1]].tr('[]', '').split(" , ")

  names.each_with_index do |pastry, index|
    desc = descriptions[index].tr('{"}', '').split(":")[1]

    if Pastry.count < 10
        Pastry.create(
          name: pastry.tr('{""}', '').split(":")[1],
          description: desc,
          price: 3.55,
          pastry_type_id: PastryType.find_by(name: 'Shortcrust Pastry').id
        )
    elsif Pastry.count < 20
      Pastry.create(
        name: pastry.tr('{""}', '').split(":")[1],
        description: desc,
        price: 2.99,
        pastry_type_id: PastryType.find_by(name: 'Filo Pastry').id
      )
    elsif Pastry.count < 30
      Pastry.create(
        name: pastry.tr('{""}', '').split(":")[1],
        description: desc,
        price: 3.70,
        pastry_type_id: PastryType.find_by(name: 'Choux Pastry').id
      )
    else
      Pastry.create(
        name: pastry.tr('{""}', '').split(":")[1],
        description: desc,
        price: 3.10,
        pastry_type_id: PastryType.find_by(name: 'Puff Pastry').id
      )
    end
  end
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?