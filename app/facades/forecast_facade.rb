class ForecastFacade
  def self.forecast(location)
    lat = LocationService.lat(location)
    lng = LocationService.lng(location)
    data = ForecastService.eta_weather(lat, lng)
    Forecast.new(data)
  end
end
