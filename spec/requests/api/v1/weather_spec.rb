require 'rails_helper'

describe 'Weather' do
  describe 'happy path' do
    it 'can return weather at eta' do
      VCR.use_cassette('weather_la') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'New York, NY',
                  end_city: 'Los Angeles, CA',
                  api_key: user.api_key
                 }

        post '/api/v1/forecast', headers: headers, params: JSON.generate(params)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        parsed = parse(response)

        expect(parsed).to have_key(:data)
        expect(parsed[:data]).to be_a(Hash)

        data = parsed[:data]

        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)

        expect(data).to have_key(:type)
        expect(data[:type]).to eq('forecast')
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        require "pry"; binding.pry
        expect(data[:attributes]).to have_key(:travel_time)
        expect(data[:attributes][:travel_time]).to eq("40:34:31")

        expect(data[:attributes]).to have_key(:weather_at_eta)
        expect(data[:attributes][:weather_at_eta]).to be_a(Hash)

        expect(data[:attributes][:weather_at_eta]).to have_key(:current_weather)
        expect(data[:attributes][:weather_at_eta][:current_weather]).to have_key(:weather)
        expect(data[:attributes][:weather_at_eta][:current_weather]).to have_key(:temp)
        expect(data[:attributes][:weather_at_eta][:current_weather][:weather][0]).to have_key(:description)
      end
    end
  end
end
