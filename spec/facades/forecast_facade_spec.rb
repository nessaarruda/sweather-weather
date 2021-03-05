require 'rails_helper'

describe ForecastFacade do
  describe 'happy path' do
    it 'returns the forecast for a city' do
      VCR.use_cassette('denver_forecast') do
        forecast = ForecastFacade.forecast('Denver, Co')

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
  describe 'sad path' do
    xit '' do
      VCR.use_cassette('denver_forecast') do
        forecast = HashFacade.forecast('Denver, Co')

        expect(forecast).to be_a(Forecast)
        # figure out how to test facades
      end
    end
  end
end
