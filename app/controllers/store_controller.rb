class StoreController < ApplicationController
  def index
    @coffees = Coffee.order(:name)
    @coffee_types = CoffeeType.all
  end

  def show
    @product = Coffee.find(params[:id])
  end
end
