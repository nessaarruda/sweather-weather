require 'rails_helper'

describe 'Road trip' do
  describe 'happy path' do
    it 'can create road trip' do
      VCR.use_cassette('route_ny_la') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'New York, NY',
                  end_city: 'Los Angeles, CA',
                  api_key: user.api_key
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(parsed).to be_a(Hash)
    		expect(parsed).to have_key(:data)
    		expect(parsed[:data]).to be_a(Hash)
    		expect(parsed[:data]).to have_key(:id)
    		expect(parsed[:data][:id]).to eq(nil)
    		expect(parsed[:data]).to have_key(:type)
    		expect(parsed[:data][:type]).to be_a(String)
    		expect(parsed[:data][:type]).to eq('roadtrip')
    		expect(parsed[:data]).to have_key(:attributes)
    		expect(parsed[:data][:attributes]).to be_a(Hash)

    		attributes = parsed[:data][:attributes]

    		expect(attributes).to have_key(:start_city)
    		expect(attributes[:start_city]).to be_a(String)
    		expect(attributes).to have_key(:end_city)
    		expect(attributes[:end_city]).to be_a(String)
    		expect(attributes).to have_key(:travel_time)
    		expect(attributes[:travel_time]).to be_a(String)
      end
    end
  end
end
