class Api::V1::BackgroundsController < ApplicationController

  def index
    if !params[:location].empty?
      background = BackgroundFacade.get_background(params[:location])
      render json: BackgroundSerializer.new(background), status: 200
    else
      render body: 'Invalid request', status: 400
    end
  end
end
