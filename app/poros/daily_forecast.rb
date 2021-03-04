class DailyForecast
  attr_reader :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(forecast)
    @sunrise =  forecast[:sunrise]
    @sunset =  forecast[:sunset]
    @max_temp =  forecast[:temp][:max]
    @min_temp =  forecast[:temp][:min]
    @conditions =  forecast[:weather][0][:description]
    @icon =  forecast[:weather][0][:icon]
  end
end
