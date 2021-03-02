require 'rails_helper'

describe 'Forecast API' do
  describe 'returns weather_at_eta' do
    describe 'happy path' do
      it 'returns current weather for a specific city at time of arrival' do
        headers = {'CONTENT_TYPE' => 'application/json','ACCEPT' => 'application/json'}
        VCR.use_cassette('forecast_la') do
          params = {location: 'Los Angeles, CA'}

          get '/api/v1/forecast', headers: headers, params: params

          expect(response).to be_successful

          parsed = parse(response)
          require "pry"; binding.pry
          expect(parsed).to have_key(:data)
          expect(parsed[:data]).to be_a(Hash)

          data = parsed[:data]

          expect(data).to have_key(:id)
          expect(data[:id]).to eq(nil)

          expect(data).to have_key(:type)
          expect(data[:type]).to eq('forecast')

          expect(data).to have_key(:attributes)
          expect(data[:attributes]).to be_a(Hash)
        end
      end
    end
  end
end
