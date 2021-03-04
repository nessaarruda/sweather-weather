class LocationService
  class << self
    def coords(location)
      ForecastService.eta_weather(lat(location), lng(location))
    end

    def lat(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
      parsed = parse(response)
      lat = parsed[:results][0][:locations][0][:latLng][:lat]
    end

    def lng(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
      parsed = parse(response)
      lng = parsed[:results][0][:locations][0][:latLng][:lng]
    end

private

    def parse(response)
      JSON(response.body, symbolize_names: true)
    end
    def conn
      conn = Faraday.new('http://www.mapquestapi.com')
    end
  end
end
