class RoadTrip
  attr_reader :start_city, :end_city, :travel_time

  def initialize(data, start_city, end_city)
    @start_city = start_city
    @end_city = end_city
    @travel_time = data[:route][:formattedTime]
  end
end
