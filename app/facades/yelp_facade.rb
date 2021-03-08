class YelpFacade
  class << self
    def food(start, destination, food_type)
      YelpService.get_food_data(food_type, destination)
    end
  end
end
