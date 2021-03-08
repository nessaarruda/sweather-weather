class Forecast
  attr_reader :current_forecast,
              :daily_forecast,
              :hourly_forecast

  def initialize(forecast)
    @current_forecast = CurrentForecast.new(forecast[:current])
    @daily_forecast = five_days_forecast(forecast)
    @hourly_forecast = either_hours_forecast(forecast)
  end

  def five_days_forecast(forecast)
    forecast[:daily][1..5].map do |daily|
      DailyForecast.new(daily)
    end
  end

  def either_hours_forecast(forecast)
    forecast[:hourly][1..8].map do |hourly|
      HourlyForecast.new(hourly)
    end
  end
end
