class YelpFacade
  class << self
    def food(start, destination, food)
      trip_data = RoadTripFacade.get_data(start, destination)
      arrival_time = unix_time_converter(trip_data.travel_time)
      food_data = YelpService.get_food_data(food, destination, arrival_time)
      Food.new(food_data, trip_data)
    end

    def unix_time_converter(time_to_arrival)
      time_to_arrival_sec = 0
      time_to_arrival.split(":").each_with_index do |time, index|
        time = time.to_i
        if index == 0
          sec = time * 3600
          time_to_arrival_sec += sec
        elsif index == 1
          sec = time * 60
          time_to_arrival_sec += sec
        elsif index == 2
          time_to_arrival_sec += time
        end
      end
      arrival_time = Time.now.strftime("%s").to_i + time_to_arrival_sec
    end
  end
end
