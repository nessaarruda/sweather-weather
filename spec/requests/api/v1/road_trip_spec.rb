require 'rails_helper'

describe 'Road trip' do
  describe 'happy path' do
    it 'can create road trip' do
      VCR.use_cassette('route_ny_la') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json',
                    'ACCEPT' => 'application/json'}
        params = {
                  start_city: 'New York, NY',
                  end_city: 'Los Angeles, CA',
                  api_key: user.api_key
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')

        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to be_a(Hash)
    		expect(parsed).to have_key(:data)
    		expect(parsed[:data]).to be_a(Hash)
    		expect(parsed[:data]).to have_key(:id)
    		expect(parsed[:data][:id]).to eq(nil)
    		expect(parsed[:data]).to have_key(:type)
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
        expect(attributes[:travel_time]).to eq("40:34:31")
      end
    end
    it 'can return weather at eta' do
      VCR.use_cassette('weather_la') do
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

        parsed = parse(response)

        expect(parsed).to have_key(:data)
        expect(parsed[:data]).to be_a(Hash)

        data = parsed[:data]

        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq('roadtrip')
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a(Hash)
        expect(data[:attributes]).to have_key(:weather_at_eta)
        expect(data[:attributes][:weather_at_eta]).to be_a(Hash)
        expect(data[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(data[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:current_weather)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:daily)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:wind_deg)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:wind_speed)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:feels_like)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:pressure)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:humidity)
        expect(data[:attributes][:weather_at_eta]).to_not have_key(:visibility)
      end
    end
  end
  describe 'sad path' do
    xit 'returns error message if route is impossible' do
      VCR.use_cassette('no_route_ny_lon') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'New York, NY',
                  end_city: 'London, UK',
                  api_key: user.api_key
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        #add test to confirm weather block is empty
        expect(response[:error]).to eq('Impossible route')
      end
    end
    xit 'returns error message if one of the cities is not provided is impossible' do
      VCR.use_cassette('no_route_ny_lon') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: '',
                  end_city: 'London, UK',
                  api_key: user.api_key
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response[:error]).to eq('Please provide both cities')
      end
    end
    it 'returns error message if api key is not provided' do
      VCR.use_cassette('no_route_ny_lon') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: '',
                  end_city: 'London, UK',
                  api_key: ''
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        #add test to confirm weather block is empty
      end
    end
    it 'returns error message if api key is incorrect' do
      VCR.use_cassette('no_route_ny_lon') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: '',
                  end_city: 'London, UK',
                  api_key: 'werGwadfbsE'
                 }

        post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end
    end
  end
end
