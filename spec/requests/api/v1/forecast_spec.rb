require 'rails_helper'

describe 'Forecast' do
  describe 'happy path' do
    it 'return current, daily and hourly forecast' do
      VCR.use_cassette('weather_ny') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json',
                    'ACCEPT' => 'application/json'}
        params = {location: "Los Angeles, CA"}

        get '/api/v1/forecast', headers: headers, params: params

        parsed = parse(response)

        expect(response).to be_successful
        expect(response.status).to eq(200)

        expect(parsed).to be_a(Hash)
        expect(parsed[:data]).to be_a(Hash)

        current = parsed[:data][:attributes][:current_forecast]

        expect(current).to have_key(:datetime)
        expect(current).to have_key(:sunset)
        expect(current).to have_key(:sunrise)
        expect(current).to have_key(:temperature)
        expect(current).to have_key(:feels_like)
        expect(current).to have_key(:humidity)
        expect(current).to have_key(:uvi)
        expect(current).to have_key(:visibility)
        expect(current[:conditions]).to be_a(String)
        expect(current[:icon]).to be_a(String)
        expect(current).to_not have_key(:weather)
        expect(current).to_not have_key(:wind_speed)
        expect(current).to_not have_key(:wind_deg)
        expect(current).to_not have_key(:dew_point)
        expect(current).to_not have_key(:clouds)

        daily = parsed[:data][:attributes][:daily_forecast]

        expect(daily.count).to eq(5)

        daily.flat_map do |day|
          expect(day).to have_key(:date)
          expect(day).to have_key(:sunrise)
          expect(day).to have_key(:sunset)
          expect(day).to have_key(:min_temp)
          expect(day).to have_key(:max_temp)
          expect(day).to have_key(:conditions)
          expect(day).to have_key(:icon)
          expect(day).to_not have_key(:dew_point)
          expect(day).to_not have_key(:wind_speed)
          expect(day).to_not have_key(:wind_deg)
          expect(day).to_not have_key(:pressure)
          expect(day).to_not have_key(:humidity)
          expect(day).to_not have_key(:clouds)
          expect(day).to_not have_key(:pop)
          expect(day).to_not have_key(:dt)
          expect(day).to_not have_key(:dt)
        end

        hourly = parsed[:data][:attributes][:hourly_forecast]

        expect(hourly.count).to eq(8)

        hourly.flat_map do |hour|
          expect(hour).to have_key(:time)
          expect(hour).to have_key(:temperature) # looks weird
          expect(hour).to have_key(:conditions)
          expect(hour).to have_key(:icon)
          expect(hour).to_not have_key(:dew_point)
          expect(hour).to_not have_key(:pressure)
          expect(hour).to_not have_key(:humidity)
          expect(hour).to_not have_key(:clouds)
          expect(hour).to_not have_key(:pop)
          expect(hour).to_not have_key(:dt)
          expect(hour).to_not have_key(:dt)
          expect(hour).to_not have_key(:wind_deg)
          expect(hour).to_not have_key(:wind_speed)
        end
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
    xit 'returns error if forecast is too far in the future' do
      VCR.use_cassette('weather_ny') do
        user = create(:user)
        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {

                  start_city: 'Los Angeles, CA',
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
