class GeoRoutesController < ApplicationController
  before_action :set_origin_destination

  def index
    render json: GeoRoute.with_origin_destination(@origin.id, @destination.id)
  end

  def create
    creator = GeoRoutesCreator.new(origin: @origin, destination: @destination)
    result = creator.process
    render json: { msg: result[:msg] }, status: result[:status]
  end

  private

  def set_origin_destination
    @origin = Location.find(params[:origin_id])
    @destination = Location.find(params[:destination_id])
  end
end
