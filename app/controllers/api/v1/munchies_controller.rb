class Api::V1::MunchiesController < ApplicationController

  def index
    food = YelpFacade.food(params[:start], params[:destination], params[:food_type])
    render json: YelpSerializer.new(food)
  end
end
