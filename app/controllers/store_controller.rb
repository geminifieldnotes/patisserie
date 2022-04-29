class StoreController < ApplicationController
  def index
    @coffees = Coffee.order(:name)
    @pastries = Pastry.all
  end

  def show
    @product = Coffee.find(params[:id])
  end
end
