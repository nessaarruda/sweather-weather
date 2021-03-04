class HourlyForecast
  attr_reader :temperature,
              :conditions,
              :icon

  def initialize(forecast)
    @temperature =  forecast[:temp]
    @conditions =  forecast[:weather][0][:description]
    @icon =  forecast[:weather][0][:icon]
  end
end
