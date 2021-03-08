class BackgroundFacade
  def self.get_background(location)
    if BackgroundService.get_image(location)[:total] == 0
      BackgroundService.get_image(location)
    else
      Background.new(BackgroundService.get_image(location))
    end
  end
end
