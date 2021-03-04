class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data, start_city, end_city, weather)
    @start_city = start_city
    @end_city = end_city
    @travel_time = data[:route][:formattedTime]
    @weather_at_eta = get_relevant_info(weather)
  end

  def get_relevant_info(weather)
    weather_arrival = {}
    weather_arrival[:temperature] = weather[:hourly][@travel_time.to_i - 1][:temp]
    weather_arrival[:conditions] = weather[:hourly][@travel_time.to_i - 1][:weather][0][:description]
    weather_arrival
  end
end
