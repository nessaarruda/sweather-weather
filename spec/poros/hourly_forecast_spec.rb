require 'rails_helper'

describe 'Hourly Forecast poro' do

  it 'exists' do
    data = {
            :dt=>1604872800,
            :temp=>55.45,
            :feels_like=>43.02,
            :pressure=>1003,
            :humidity=>20,
            :dew_point=>16.95,
            :clouds=>10,
            :visibility=>10000,
            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
            :pop=>0
          }

    forecast = HourlyForecast.new(data)

    expect(forecast).to be_a(HourlyForecast)
    expect(forecast.time).to eq(Time.at(data[:dt]))
    expect(forecast.temperature).to eq(data[:temp])
    expect(forecast.conditions).to eq(data[:weather][0][:description])
    expect(forecast.icon).to eq(data[:weather][0][:icon])
  end
end
