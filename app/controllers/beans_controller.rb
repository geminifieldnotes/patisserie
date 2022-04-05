class BeansController < ApplicationController
  before_action :set_bean, only: %i[show]

  # GET /beans or /beans.json
  def index
    @beans = Bean.all
  end

  # GET /beans/1 or /beans/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bean
    @bean = Bean.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bean_params
    params.require(:bean).permit(:name, :description)
  end
end
