class Forecast
  attr_reader :weather_at_eta

  def initialize(forecast)
    @temp = forecast[:temp]
    @description = forecast[:weather][0][:description]
    @wheater_at_eta = {temperature: @temp, conditions: @description}
  end
end
