class Api::V1::MunchiesController < ApplicationController

  def index
    conn = Faraday.new('https://api.yelp.com')
    response = conn.get("/v3/businesses/search?location=#{params[:destination]}&open_now=1&categories=#{params[:food_type]}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
