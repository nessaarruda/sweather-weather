class Api::V1::BackgroundsController < ApplicationController

  def index
    background = BackgroundFacade.get_background(params[:location]) #returns Background object from poro
    render json: BackgroundSerializer.new(background)
  end
end
