class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.get_data(params[:start_city], params[:end_city])

    if !params[:api_key].empty?
      render json: RoadTripSerializer.new(road_trip), status: 200
    else
      render body: 'Unable to validate API key', status: 401
    end
  end
end
