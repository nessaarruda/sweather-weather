class RoadTripService
  class << self
    def trip_data(start_city, end_city)
      response = conn.get("/directions/v2/route?key=#{ENV['MAPS_API_KEY']}&from=#{start_city}&to=#{end_city}")
      parsed = parsed(response)
      RoadTrip.new(parsed, start_city, end_city, coords(end_city))
    end

    def coords(location)
      ForecastService.weather_data(lat(location), lng(location))
    end

    def lat(location)
      response = conn2.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
      parsed = parse(response)
      lat = parsed[:results][0][:locations][0][:latLng][:lat]
    end

    def lng(location)
      response = conn2.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
      parsed = parse(response)
      lnt = parsed[:results][0][:locations][0][:latLng][:lng]
    end

    def self.parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end


    def conn2
      conn = Faraday.new('http://www.mapquestapi.com')
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
