class PastriesController < InheritedResources::Base
  before_action :set_pastry, only: %i[ show edit update destroy ]
  def show
    @action = "show"
  end

  private
    def set_pastry
      @pastry = Pastry.find(params[:id])
    end

    def pastry_params
      params.require(:pastry).permit(:name, :description, :price, :pastry_type_id)
    end

end
