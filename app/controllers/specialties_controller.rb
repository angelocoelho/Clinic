class SpecialtiesController < InheritedResources::Base

  private

    def specialty_params
      params.require(:specialty).permit(:name)
    end

end
