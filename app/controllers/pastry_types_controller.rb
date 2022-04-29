class PastryTypesController < InheritedResources::Base

  private

    def pastry_type_params
      params.require(:pastry_type).permit(:name, :description)
    end

end
