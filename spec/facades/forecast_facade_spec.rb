require 'rails_helper'

RSpec.describe ForecastFacade do
  describe 'happy path' do
    it 'returns the forecast for a city' do
      VCR.use_cassette('denver_forecast') do
        forecast = ForecastFacade.forecast('Denver, Co')

        expect(forecast).to be_a(Forecast)
        # getting Facade object back, don't know how to access the content. Maybe I'm getting the wrong structure back
      end
    end
  end
  describe 'sad path' do
    xit '' do
      VCR.use_cassette('denver_forecast') do
        forecast = ForecastFacade.forecast('Denver, Co')

        expect(forecast).to be_a(Forecast)
        # getting Facade object back, don't know how to access the content. Maybe I'm getting the wrong structure back
      end
    end
  end
end
