class Api::V1::RoadTripController < ApplicationController
  def create
    if !valid_api_key?(params[:api_key]) || params[:start_city].empty? || params[:end_city].empty?
      render json: 'Invalid request' , status: 401 
    else
      road_trip = RoadTripFacade.get_data(params[:start_city], params[:end_city])
      render json: RoadTripSerializer.new(road_trip), status: 200
    end
  end
end
