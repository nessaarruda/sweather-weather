class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = RoadTripFacade.new(params[:origin], params[:destination])
    render json: RoadTripSerializer.new(road_trip), status: 200
  end
end
