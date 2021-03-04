class ForecastService
  def self.eta_weather(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely&appid=#{ENV['FORECAST_API_KEY']}")
    parsed = parse(response)
  end

private

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end
end
