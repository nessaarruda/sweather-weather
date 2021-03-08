class YelpFacade
  class << self
    def food(start, destination, food)
      trip_data = RoadTripFacade.get_data(start, destination)
      arrival_time = unix_time_converter(trip_data.travel_time)
      food_data = YelpService.get_food_data(food, destination, arrival_time)
      Food.new(food_data, trip_data)
    end

    def unix_time_converter(travel_time)

    end
  end
end
