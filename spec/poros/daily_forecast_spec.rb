require 'rails_helper'

RSpec.describe 'Daily Forecast poro' do
  it 'exists' do
    data = {
            :dt=>1604944800,
            :sunrise=>1604929101,
            :sunset=>1604965761,
            :temp=>{:day=>38.82, :min=>32.52, :max=>43.63, :night=>33.04, :eve=>33.4, :morn=>40.06},
            :feels_like=>{:day=>31.66, :night=>27.59, :eve=>25.65, :morn=>28.42},
            :pressure=>1008,
            :humidity=>70,
            :dew_point=>23.61,
            :wind_speed=>5.86,
            :wind_deg=>48,
            :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04d"}],
            :clouds=>76,
            :pop=>0.88,
            :uvi=>2.41
          }

    forecast = DailyForecast.new(data)

    expect(forecast).to be_a(DailyForecast)

    expect(forecast.date).to eq('2020-11-09 11:00:00 -0700')
    expect(forecast.sunrise).to eq('2020-11-09 06:38:21 -0700')
    expect(forecast.sunset).to eq('2020-11-09 16:49:21 -0700')
    expect(forecast.max_temp).to eq(data[:temp][:max])
    expect(forecast.min_temp).to eq(data[:temp][:min])
    expect(forecast.conditions).to eq(data[:weather][0][:description])
    expect(forecast.icon).to eq(data[:weather][0][:icon])
  end
end
