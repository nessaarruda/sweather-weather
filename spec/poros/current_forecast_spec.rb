require 'rails_helper'

describe 'Current Forecast poro' do
  it 'exists' do

    data = {:dt=>1604856223,
            :sunrise=>1604842631,
            :sunset=>1604879418,
            :temp=>52.75,
            :feels_like=>33.71,
            :pressure=>1003,
            :humidity=>14,
            :dew_point=>7.77,
            :uvi=>2.77,
            :clouds=>20,
            :visibility=>10000,
            :wind_speed=>23.04,
            :wind_deg=>200,
            :wind_gust=>27.51,
            :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}]}

    forecast = CurrentForecast.new(data)

    expect(forecast).to be_a(CurrentForecast)
    expect(forecast.datetime).to eq('2020-11-08 10:23:43 -0700')
    expect(forecast.sunrise).to eq('2020-11-08 06:37:11 -0700')
    expect(forecast.sunset).to eq('2020-11-08 16:50:18 -0700')
    expect(forecast.temperature).to eq(data[:temp])
    expect(forecast.feels_like).to eq(data[:feels_like])
    expect(forecast.humidity).to eq(data[:humidity])
    expect(forecast.uvi).to eq(data[:uvi])
    expect(forecast.visibility).to eq(data[:visibility])
    expect(forecast.conditions).to eq(data[:weather][0][:description])
    expect(forecast.icon).to eq(data[:weather][0][:icon])
  end
end
