class CurrentForecast
  attr_reader :sunrise,
              :sunset,
              :temperature,
              :humidity,
              :visibility,
              :uvi,
              :conditions,
              :icon,
              :feels_like,
              :datetime

  def initialize(forecast)
    @datetime = convert_stamp(forecast[:dt])
    @sunrise =  convert_stamp(forecast[:sunrise])
    @sunset =  convert_stamp(forecast[:sunset])
    @temperature =  forecast[:temp]
    @humidity =  forecast[:humidity]
    @visibility =  forecast[:visibility]
    @uvi =  forecast[:uvi]
    @conditions =  forecast[:weather][0][:description]
    @icon =  forecast[:weather][0][:icon]
    @feels_like =  forecast[:feels_like]
  end

  def convert_stamp(data)
    Time.at(data)
  end
end
