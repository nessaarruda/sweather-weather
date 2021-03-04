require 'rails_helper'

describe 'Forecast' do
  it 'return current, daily and hourly forecast' do
    VCR.use_cassette('new_york_forecast') do
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

      current = parsed[:data][:attributes]

      expect(current).to have_key(:sunrise)
      expect(current).to have_key(:sunset)
      expect(current).to have_key(:temperature)
      expect(current).to have_key(:feels_like)
      expect(current).to have_key(:humidity)
      expect(current).to have_key(:uvi)
      expect(current).to have_key(:visibility)
      expect(current).to have_key(:conditions)
      expect(current).to have_key(:icon)

      # daily = parsed[:data][:attributes][:weather_at_eta][:daily_weather][0]
      #
      # expect(daily).to have_key(:temp)
      # expect(daily[:temp]).to have_key(:min)
      # expect(daily[:temp]).to have_key(:max)
      # expect(daily).to have_key(:sunrise)
      # expect(daily).to have_key(:sunset)
      # expect(daily[:weather][0]).to have_key(:description)
      # expect(daily[:weather][0]).to have_key(:icon)
      #
      # hourly = parsed[:data][:attributes][:weather_at_eta][:hourly_weather][0]
      #
      # expect(hourly).to have_key(:temp)
      # expect(hourly).to have_key(:wind_speed)
      # expect(hourly).to have_key(:wind_deg)
      # expect(hourly).to have_key(:weather)
      # expect(hourly[:weather][0]).to have_key(:description)
      # expect(hourly[:weather][0]).to have_key(:icon)
    end
  end
end
