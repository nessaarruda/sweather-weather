class CurrentForecast
  attr_reader :current_weather,
              :sunrise,
              :sunset,
              :temperature,
              :humidity,
              :visibility,
              :uvi,
              :conditions,
              :icon,
              :feels_like
  def initialize(forecast)
    @current_weather = forecast[:current]
    @sunrise = forecast[:current][:sunrise]
    @sunset = forecast[:current][:sunset]
    @temperature = forecast[:current][:temp]
    @feels_like = forecast[:current][:feels_like]
    @humidity = forecast[:current][:humidity]
    @uvi = forecast[:current][:uvi]
    @visibility = forecast[:current][:visibility]
    @conditions = forecast[:current][:weather][0][:description]
    @icon = forecast[:current][:weather][0][:icon]
  end
end
