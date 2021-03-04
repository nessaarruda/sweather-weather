class Forecast
  attr_reader :current_forecast,
              :daily_forecast,
              :hourly_forecast

  def initialize(forecast)
    @current_forecast = CurrentForecast.new(forecast[:current])
    @daily_forecast = forecast[:daily][1..5].map {|daily| DailyForecast.new(daily)}
    @hourly_forecast = forecast[:hourly][1..8].map {|hourly| HourlyForecast.new(hourly)}
  end
end
