require 'rails_helper'

describe ForecastService do
  describe 'happy path' do
    it 'returns the forecast based on coordinates' do
      VCR.use_cassette('denver_forecast') do
        response = ForecastService.eta_weather(39.738453, -104.984853)
        # check how to test this
        expect(response).to be_a(Hash)
      end
    end
  end

  describe 'sad path' do
    xit 'no matching coordinates' do #returning hash, with info. Need conditional
      VCR.use_cassette('denver_forecast') do
        response = ForecastService.eta_weather(39.738453, -104.984853)

        expect(response.body).to have_key(:erros)
      end
    end
  end
end
