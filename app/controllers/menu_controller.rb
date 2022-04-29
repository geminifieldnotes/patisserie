class MenuController < ApplicationController
  def index
    @black_coffee_id = CoffeeType.find_by(name: 'Black Coffee').id
    @black_coffees = Coffee.where(coffee_type_id: @black_coffee_id)
    @espresso_id = CoffeeType.find_by(name: 'Espresso').id
    @espresso_coffees = Coffee.where(coffee_type_id: @espresso_id)
    @milk_based_id = CoffeeType.find_by(name: 'Milk-based Beverage').id
    @milk_based_coffees = Coffee.where(coffee_type_id: @milk_based_id)
    @tea_id = CoffeeType.find_by(name: 'Tea').id
    @teas = Coffee.where(coffee_type_id: @tea_id)
  end
end
