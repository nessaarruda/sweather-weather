class ForecastFacade
  def self.forecast(location)
    lat = LocationService.lat(location)
    lng = LocationService.lng(location)
    ForecastService.weather(lat, lng)


  end
end
