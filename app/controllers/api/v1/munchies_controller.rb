class Api::V1::MunchiesController < ApplicationController

  def index
    food = YelpFacade.food(params[:start], params[:destination], params[:food])

    render json: YelpSerializer.new(food), status: 200
  end
end
