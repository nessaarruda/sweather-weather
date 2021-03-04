class RoadTripFacade

  def self.get_data(start_city, end_city)
    trip_data = RoadTripService.trip_data(start_city, end_city)
    weather_data = LocationService.forecast_data(end_city)

    RoadTrip.new(trip_data, start_city, end_city, weather_data)
  end
end
