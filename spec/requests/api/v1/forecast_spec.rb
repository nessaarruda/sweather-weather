require 'rails_helper'

describe 'Forecast' do
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

      expect(current).to have_key(:sunrise)
      expect(current).to have_key(:sunset)
      expect(current).to have_key(:temp)
      expect(current).to have_key(:feels_like)
      expect(current).to have_key(:humidity)
      expect(current).to have_key(:uvi)
      expect(current).to have_key(:visibility)
      expect(current).to have_key(:weather)
      expect(current[:weather][0]).to have_key(:description)
      expect(current[:weather][0]).to have_key(:icon)

      daily = parsed[:data][:attributes][:weather_at_eta][:daily_weather][0]

      expect(daily).to have_key(:temp)
      expect(daily[:temp]).to have_key(:min)
      expect(daily[:temp]).to have_key(:max)
      expect(daily).to have_key(:sunrise)
      expect(daily).to have_key(:sunset)
      expect(daily[:weather][0]).to have_key(:description)
      expect(daily[:weather][0]).to have_key(:icon)

      hourly = parsed[:data][:attributes][:weather_at_eta][:hourly_weather][0]

      expect(hourly).to have_key(:temp)
      expect(hourly).to have_key(:wind_speed)
      expect(hourly).to have_key(:wind_deg)
      expect(hourly).to have_key(:weather)
      expect(hourly[:weather][0]).to have_key(:description)
      expect(hourly[:weather][0]).to have_key(:icon)
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
      expect(data[:type]).to eq('roadtrip')
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

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
