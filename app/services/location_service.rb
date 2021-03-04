class LocationService
  class << self
  def forecast_data(location)
    data = ForecastService.eta_weather(lat(location), lng(location))
  end

  def lat(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
    parsed = parse(response)
    lat = parsed[:results][0][:locations][0][:latLng][:lat]
  end

  def lng(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV['MAPS_API_KEY']}&location=#{location}")
    parsed = parse(response)
    lnt = parsed[:results][0][:locations][0][:latLng][:lng]
  end
end

private

  def self.conn
    conn = Faraday.new('http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
