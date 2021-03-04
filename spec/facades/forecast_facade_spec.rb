require 'rails_helper'

describe ForecastFacade do
  describe 'happy path' do
    it 'returns the forecast for a city' do
      VCR.use_cassette('denver_forecast') do
        forecast = ForecastFacade.forecast('Denver, Co')

        expect(forecast).to be_a(Forecast)
        # figure out how to test facades
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
