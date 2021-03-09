class Api::V1::ForecastController < ApplicationController
  def show
    if !params[:location].empty?
      forecast = ForecastFacade.forecast(params[:location])
      render json: ForecastSerializer.new(forecast)
    else
      render json: 'Please provide a valid location' , status: 401
    end
  end
end
