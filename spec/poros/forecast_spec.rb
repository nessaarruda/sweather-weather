require 'rails_helper'
describe Forecast do
  describe 'happy path' do
    xit 'exists and has attributes' do
      current = {current: "weather"}
      daily = {daily: "weather"}
      hourly = {hourly: "weather"}

      weather = Forecast.new(current, daily, hourly)

      expect(weather).to be_a(Forecast)
      expect(weather.id).to eq(nil)
      expect(weather.current_weather).to eq(current)
      expect(weather.daily_weather).to eq(daily)
      expect(weather.hourly_weather).to eq(hourly)
    end
  end
  describe 'sad path' do
    xit '' do
    end
  end
end
