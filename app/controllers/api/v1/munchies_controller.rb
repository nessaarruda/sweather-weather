class Api::V1::MunchiesController < ApplicationController

  def index
    if !params[:food].empty?
      food = YelpFacade.food(params[:start], params[:destination], params[:food])
      render json: YelpSerializer.new(food), status: 200
    else
      render json: 'Please provide type of food' , status: 401
    end
  end
end
