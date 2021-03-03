class ForecastFacade
  def self.forecast(location)
    lat = RoadTripService.lat(location)
    lng = RoadTripService.lng(location)
    ForecastService.eta_weather(lat, lng)
  end
end
