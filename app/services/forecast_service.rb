class ForecastService
  def self.weather_data(lat, lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&exclude=minutely&appid=#{ENV['FORECAST_API_KEY']}")
    parsed = parse(response)
    forecast = parsed[:hourly].first(40).last
    Forecast.new(forecast)
  end

  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end
end
