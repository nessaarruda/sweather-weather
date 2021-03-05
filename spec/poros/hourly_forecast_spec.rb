require 'rails_helper'

RSpec.describe 'Hourly Forecast poro' do
  before :each do
    @attr = {
            :dt=>1604872800,
            :temp=>55.45,
            :feels_like=>43.02,
            :pressure=>1003,
            :humidity=>20,
            :dew_point=>16.95,
            :clouds=>10,
            :visibility=>10000,
            :wind_speed=>12.46,
            :wind_deg=>196,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :pop=>0
          }
  end

  xit 'exists' do
    forecast = HourlyForecast.new(@attr)

    expect(forecast).to be_a(HourlyForecast)

    expect(forecast.time).to eq(Time.at(@attr[:dt]).strftime('%H:%M:%S'))
    expect(forecast.temperature).to eq(@attr[:temp])
    expect(forecast.wind_speed).to eq("#{@attr[:wind_speed]} mph")
    expect(forecast.wind_direction).to eq('from S')
    expect(forecast.conditions).to eq(@attr[:weather][0][:description])
    expect(forecast.icon).to eq(@attr[:weather][0][:icon])
  end

  xit 'can convert wind direction in degrees to a cardinal direction' do
    @attr[:wind_deg] = 348.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from N')


    @attr[:wind_deg] = 0
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from N')

    @attr[:wind_deg] = 33.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from NE')

    @attr[:wind_deg] = 78.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from E')

    @attr[:wind_deg] = 123.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from SE')

    @attr[:wind_deg] = 168.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from S')

    @attr[:wind_deg] = 213.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from SW')

    @attr[:wind_deg] = 258.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from W')

    @attr[:wind_deg] = 303.75
    forecast = HourlyForecast.new(@attr)
    expect(forecast.wind_direction).to eq('from NW')
  end
end
