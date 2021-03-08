class YelpService
  class << self
    def get_food_data(food_type, destination)
      response = conn.get('/v3/businesses/search') do |req|
          req.params['term'] = food_type
          req.params['location'] = destination
          req.params['limit'] = 1
          req.params['open_now'] = true
        end
      parsed = parse(response)
      require "pry"; binding.pry
    end

private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'https://api.yelp.com') do |req|
        req.headers['Authorization'] = ENV['YELP_API_KEY']
      end
    end
  end
end
