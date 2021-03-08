class HourlyForecast
  attr_reader :temperature,
              :conditions,
              :icon,
              :time

  def initialize(forecast)
    @time = convert_stamp(forecast[:dt])
    @temperature =  forecast[:temp]
    @conditions =  forecast[:weather][0][:description]
    @icon =  forecast[:weather][0][:icon]
  end

  def convert_stamp(data)
    Time.at(data)
  end
end
