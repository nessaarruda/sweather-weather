class Api::V1::RoadTripController < ApplicationController
  def create
    if valid_api_key?(params[:api_key])
      road_trip = RoadTripFacade.get_data(params[:start_city], params[:end_city])
      render json: RoadTripSerializer.new(road_trip), status: 200
    else
      render json: 'Unauthorized' , status: 401 # https://apidock.com/rails/v5.2.3/ActiveModel/Errors/full_messages
    end
  end
end
