class YelpService
  class << self
    def get_food_data(food, destination, time_of_arrival)
      response = conn.get('/v3/businesses/search') do |req|
          req.params['categories'] = food
          req.params['location'] = destination
          req.params['limit'] = 1
          req.params['open_at'] = time_of_arrival
        end
      parsed = parse(response)
    end

private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.yelp.com') do |req|
        req.headers['Authorization'] = "Bearer #{ENV['YELP_API_KEY']}"
      end
    end
  end
end
