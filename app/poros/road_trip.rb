class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data, start_city, end_city, forecast)
    @start_city = start_city
    @end_city = end_city
    @travel_time = data[:route][:formattedTime]
    @weather_at_eta = forecast
  end
end
