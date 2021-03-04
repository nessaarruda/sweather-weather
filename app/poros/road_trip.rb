class RoadTrip
  attr_reader :travel_time,
              :weather_at_eta,
              :start_city,
              :end_city

  def initialize(trip_data, start_city, end_city, weather_data)
    @travel_time = trip_data[:route][:formattedTime]
    @start_city = start_city
    @end_city = end_city
    @weather_at_eta = weather_data
  end
end
