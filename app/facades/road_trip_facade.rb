class RoadTripFacade

  def self.get_data(start_city, end_city)
    trip_data = RoadTripService.trip_data(start_city, end_city)
    location = LocationService.coords(end_city)
    RoadTrip.new(trip_data, start_city, end_city, location)
  end
end
