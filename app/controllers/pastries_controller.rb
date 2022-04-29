class PastriesController < InheritedResources::Base

  private

    def pastry_params
      params.require(:pastry).permit(:name, :description, :price, :pastry_type_id)
    end

end
