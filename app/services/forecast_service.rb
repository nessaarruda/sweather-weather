class ForecastService
  def self.eta_weather(lat, lng)
    response = conn.get("/data/2.5/onecall?") do |req|
      req.params['appid'] = ENV['FORECAST_API_KEY']
      req.params['lat'] = lat
      req.params['lon'] = lng
      req.params['units'] = 'imperial'
      req.params['exclude'] = 'minutely'
    end
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
