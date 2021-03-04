class Api::V1::ForecastController < ApplicationController
  def create
    render json: CurrentForecastSerializer.new(ForecastFacade.forecast(params[:end_city]))
  end
end
