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

Bean.delete_all
# Taxonomy API
bean_url = URI('https://starducks-mongodb-server.herokuapp.com/coffee')

bean_http = Net::HTTP.new(bean_url.host, bean_url.port)
bean_http.use_ssl = true
bean_http.verify_mode = OpenSSL::SSL::VERIFY_NONE

bean_request = Net::HTTP::Get.new(bean_url)
# tax_request['x-rapidapi-host'] = 'animaliapi3.p.rapidapi.com'
# tax_request['x-rapidapi-key'] = '4e918625e2msh97a4cf18c9c9154p1df0bdjsn8d5112e81787'

bean_response = bean_http.request(bean_request)
# tax_response_data = tax_response.read_body
third_party_beans = JSON.parse(bean_response.read_body)

# CoffeeBean.delete_all

# 55.times do
third_party_beans.each do |x|
  Bean.create(
    name: x['title'],
    description: x['description']
  )
end
# CoffeeBean.create(
#   name: taxonomy['title'],
#   description: taxonomy['description']
# )
# end

puts Bean.count
