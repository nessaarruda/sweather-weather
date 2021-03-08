require 'rails_helper'

describe 'Forecast Facade' do
  it 'returns the forecast for a city' do
    VCR.use_cassette('denver_forecast') do
      forecast = ForecastFacade.forecast('Denver, CO')

      expect(forecast).to be_a(Forecast)
      expect(forecast.current_forecast).to be_a(CurrentForecast)
      expect(forecast.daily_forecast).to be_an(Array)

      forecast.daily_forecast.each do |daily|
        expect(daily).to be_a(DailyForecast)
      end

      expect(forecast.hourly_forecast).to be_an(Array)

      forecast.hourly_forecast.each do |hourly|
        expect(hourly).to be_a(HourlyForecast)
      end
    end
  end
end
