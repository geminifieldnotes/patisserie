class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show edit update destroy ]

  # GET /coffees or /coffees.json
  def index
    if params['type'].blank? or params['type']['id'].blank?
      @coffees = Coffee.all
    elsif
      coffee_type = CoffeeType.find(params['type']['id'])
      @coffees = coffee_type.coffees
    end
    @coffees = @coffees.search(params[:search]).order(:id).page(params[:page])
  end

  # GET /coffees/1 or /coffees/1.json
  def show
    @action = "show"
  end

  # GET /coffees/new
  def new
    @coffee = Coffee.new
    @coffee.image = coffee_params[:file]
    @beans = Bean.order(:name)
    @coffee_types = CoffeeType.order(:name)
  end

  # GET /coffees/1/edit
  def edit
    @beans = Bean.order(:name)
    @coffee_types = CoffeeType.order(:name)
  end

  # POST /coffees or /coffees.json
  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.image = coffee_params[:file]

    respond_to do |format|
      if @coffee.save
        # format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully created." }
        redirect_to coffee_url(@coffee)
        flash[:info] = "Coffee was successfully created."
        format.json { render :show, status: :created, location: @coffee }
      else
        flash[:notice] = "Coffee was not created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffees/1 or /coffees/1.json
  def update
    respond_to do |format|
      puts coffee_params
      @coffee.update(coffee_params)
      if @coffee.update(coffee_params)
        format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffees/1 or /coffees/1.json
  def destroy
    @coffee.destroy

    respond_to do |format|
      format.html { redirect_to coffees_url, notice: "Coffee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coffee_params
      params.require(:coffee).permit(:name, :description, :price, :bean_id, :coffee_type_id, :image, :search, :id)
    end
end
