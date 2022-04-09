# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'nokogiri'
# require 'httparty'
# require 'byebug'

require 'uri'
require 'net/http'
require 'openssl'
require 'csv'


Bean.delete_all
CoffeeType.delete_all
Coffee.delete_all

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
    price: 3.99
  )
end

# CoffeeType.create(
#   name: 'Turkish Coffee',
#   description: 'A rich, thick, and delightful drink to be enjoyed slowly with good company. It is brewed in a copper coffee pot called a cezve (jez-VEY), made with powder-like ground coffee, and sweetened to the drinker\'s taste.'
# )

# CoffeeType.create(
#   name: 'Vietnamese Coffee',
#   description: 'Traditionally brewed in a phin – a small metal cup that fits over a mug or cup– and brews incredibly slowly, but makes a strong and small coffee which resembles a thicker, more caffeinated espresso.'
# )
# CoffeeType.create(
#   name: 'Bulletproof Coffee',
#   description:'A high fat, low carb standard brewed coffee with coconut oil and unsalted butter
# )