class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.get_data(params[:start_city], params[:end_city])
    render json: RoadTripSerializer.new(road_trip), status: 200
  end
end
