class RoadTripService
  class << self
    def trip_data(start_city, end_city)
      response = conn.get("/directions/v2/route?key=#{ENV['MAPS_API_KEY']}&from=#{start_city}&to=#{end_city}")
      parsed = parsed(response)
    end

  private

    def parsed(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new("http://www.mapquestapi.com/")
    end
  end
end
