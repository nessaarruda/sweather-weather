require 'rails_helper'

describe 'Forecast' do
  describe 'happy path' do
    it 'return current, daily and hourly forecast' do
      VCR.use_cassette('weather_ny') do

        headers = {
          CONTENT_TYPE: 'application/json',
          ACCEPT: 'application/json'
        }
        params = {location: "Los Angeles, CA"}

        get '/api/v1/forecast', headers: headers, params: params

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')

        parsed = parse(response)

        expect(parsed).to be_a(Hash)
        expect(parsed[:data]).to be_a(Hash)
        expect(parsed[:data][:id]).to eq(nil)
        expect(parsed[:data][:type]).to eq("forecast")

        current = parsed[:data][:attributes][:current_forecast]

        expect(current).to have_key(:datetime)
        expect(current).to have_key(:sunset)
        expect(current).to have_key(:sunrise)
        expect(current[:datetime]).to_not be_a(Integer)
        expect(current[:sunset]).to_not be_a(Integer)
        expect(current[:sunrise]).to_not be_a(Integer)
        expect(current).to have_key(:temperature)
        expect(current[:temperature]).to be_a(Float )
        expect(current).to have_key(:feels_like)
        expect(current[:feels_like]).to be_a(Float)
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
          expect(day[:datetime]).to_not be_a(Integer)
          expect(day[:sunset]).to_not be_a(Integer)
          expect(day[:sunrise]).to_not be_a(Integer)
          expect(day).to have_key(:min_temp)
          expect(day[:min_temp]).to be_a(Float)
          expect(day).to have_key(:max_temp)
          expect(day[:max_temp]).to be_a(Float)
          expect(day).to have_key(:conditions)
          expect(day).to have_key(:icon)
          expect(day[:icon]).to be_a(String)
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
          expect(hour[:time]).to_not be_a(Integer)
          expect(hour).to have_key(:temperature)
          expect(hour[:temperature]).to be_a(Float)
          expect(hour).to have_key(:conditions)
          expect(hour).to have_key(:icon)
          expect(hour[:icon]).to be_a(String)
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
    it 'returns erros if location is blank' do
      VCR.use_cassette('no_weather') do

        headers = {
          CONTENT_TYPE: 'application/json',
          ACCEPT: 'application/json'
        }
        params = {location: ""}

        get '/api/v1/forecast', headers: headers, params: params

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response.body).to eq("Please provide a valid location")
      end
    end
    xit 'returns erros if location is invalid' do
      VCR.use_cassette('no_weather') do

        headers = {
          CONTENT_TYPE: 'application/json',
          ACCEPT: 'application/json'
        }
        params = {location: "defbaqwer"}

        get '/api/v1/forecast', headers: headers, params: params
        require "pry"; binding.pry
        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response.body).to eq("Please provide a valid location")
      end
    end
    xit 'returns error if forecast is too far in the future' do
      VCR.use_cassette('weather_ny') do

        headers = {'CONTENT_TYPE' => 'application/json'}
        params = {
                  start_city: 'Los Angeles, CA',
                  end_city: 'New York, NY',
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
