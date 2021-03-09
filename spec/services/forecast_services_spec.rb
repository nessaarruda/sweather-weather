require 'rails_helper'

describe ForecastService do
  it 'returns the forecast based on coordinates' do
    VCR.use_cassette('denver_forecast') do
      response = ForecastService.eta_weather(39.738453, -104.984853)


      expect(response).to be_a(Hash)
      expect(response).to have_key(:current)
      expect(response).to have_key(:hourly)
      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an(Array)
      expect(response[:hourly]).to be_an(Array)
    end
  end
end
