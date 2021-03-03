require 'rails_helper'

describe ForecastService do
  describe 'happy path' do
    it 'returns the forecast based on coordinates' do
      VCR.use_cassette('denver_forecast') do
        response = ForecastService.eta_weather(39.738453, -104.984853)
        # getting Forecast object back, don't know how to access the content. Maybe I'm getting the wrong structure back
        expect(response).to be_a(Forecast)
      end
    end
  end

  describe 'sad path' do
    it 'no matching coordinates' do
      VCR.use_cassette('denver_forecast') do
        response = ForecastService.eta_weather(39.738453, -104.984853)
        # getting Forecast object back, don't know how to access the content. Maybe I'm getting the wrong structure back
        expect(response).to be_a(Forecast)
      end
    end
  end
end
