class DailyForecast
  attr_reader :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :date,
              :icon

  def initialize(forecast)
    @date = convert_stamp(forecast[:dt])
    @sunrise = convert_stamp(forecast[:sunrise])
    @sunset = convert_stamp(forecast[:sunset])
    @max_temp =  forecast[:temp][:max]
    @min_temp =  forecast[:temp][:min]
    @conditions =  forecast[:weather][0][:description]
    @icon =  forecast[:weather][0][:icon]
  end

  def convert_stamp(data)
    Time.at(data)
  end
end
