class Api::V1::BackgroundsController < ApplicationController

  def index
    background = BackgroundFacade.get_background(params[:location]) #returns Background object from poro
    if !params[:location].empty?
      render json: BackgroundSerializer.new(background), status: 200
    else
      render body: 'Invalid request', status: 400
    end
  end
end
