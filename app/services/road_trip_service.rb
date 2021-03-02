class RoadTripService

  def self.trip_data(start_city, end_city)
    response = conn.get("/directions/v2/route?key=#{ENV['MAPS_API_KEY']}&from=#{start_city}&to=#{end_city}")
    parsed = parsed(response)
    RoadTrip.new(parsed, start_city, end_city)
  end

private

  def self.parsed(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    conn = Faraday.new("http://www.mapquestapi.com/")
  end
end
