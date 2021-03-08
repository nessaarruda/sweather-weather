class Food
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(food_data, trip_data)
    @destination_city = trip_data.end_city
    @travel_time = trip_data.travel_time
    @forecast = trip_data.weather_at_eta
    @restaurant = get_relevant_info(food_data)
  end

  def get_relevant_info(food_data)
    restaurant = {}
    restaurant[:name] = food_data[:businesses][0][:name]
    restaurant[:address] = food_data[:businesses][0][:location][:address1]
    restaurant
  end
end
