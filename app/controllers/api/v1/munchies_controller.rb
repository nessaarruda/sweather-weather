class YelpController < ApplicationController

  def index
    conn = Fareday.new('https://api.yelp.com')
    response = conn.get('/v3/businesses/search') do |req|
      req.params['term'] = food_type
      req.params['location'] = location
      req.params['limit'] = 1
      req.params['open_now'] = true
      req.params['Authorization'] = ENV['YELP_API_KEY']
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
