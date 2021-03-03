class Forecast
  attr_reader :current_forecast,
              :daily_forecast,
              :hourly_forecast

  def initialize(forecast)
    @current_weather = forecast[:current]
    @daily_weather = forecast[:daily]
    @hourly_weather = forecast[:hourly]
  end
end
