require 'rails_helper'

RSpec.describe 'Current Forecast poro' do
  xit 'exists' do
    # not sure how to test
    attr = {:dt=>1604856223,
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

    weather = CurrentWeather.new(attr)

    expect(weather).to be_a(CurrentWeather)
    expect(weather.datetime).to eq('2020-11-08 10:23:43 -0700')
    expect(weather.sunrise).to eq('2020-11-08 06:37:11 -0700')
    expect(weather.sunset).to eq('2020-11-08 16:50:18 -0700')
    expect(weather.temperature).to eq(attr[:temp])
    expect(weather.feels_like).to eq(attr[:feels_like])
    expect(weather.humidity).to eq(attr[:humidity])
    expect(weather.uvi).to eq(attr[:uvi])
    expect(weather.visibility).to eq(attr[:visibility])
    expect(weather.conditions).to eq(attr[:weather][0][:description])
    expect(weather.icon).to eq(attr[:weather][0][:icon])
  end
end
