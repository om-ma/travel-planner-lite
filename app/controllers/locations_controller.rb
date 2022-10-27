class LocationsController < ApplicationController

  def create
    location = Location.new(location_params)

    if location.save
      render json: location, status: 201
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.require(:location).permit(:category, :longitude, :latitude, :address, :author)
  end

end
