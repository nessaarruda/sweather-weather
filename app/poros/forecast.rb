class Forecast
  attr_reader :current_weather,
              :sunrise,
              :sunset,# :daily_forecast,
              :temperature,# :hourly_forecast
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
    # @daily_weather = forecast[:daily]
    # @hourly_weather = forecast[:hourly]
  end
end
