require 'rails_helper'

describe Forecast do
  it 'exists and has attributes' do
    data = { lat: 34.0522,
             lon: -118.2433,
             timezone: 'America/Los_Angeles',
             timezone_offset: -28_800,
             current: { dt: 1_614_995_997,
                        sunrise: 1_614_953_781,
                        sunset: 1_614_995_562,
                        temp: 64.76,
                        feels_like: 57.63,
                        pressure: 1016,
                        humidity: 32,
                        dew_point: 34.25,
                        uvi: 0,
                        clouds: 1,
                        visibility: 10_000,
                        wind_speed: 6.91,
                        wind_deg: 250,
                        weather: [{ id: 800, main: 'Clear', description: 'clear sky',
                                    icon: '01n' }] },
             hourly: [{ dt: 1_614_992_400,
                        temp: 64.76,
                        feels_like: 56.3,
                        pressure: 1016,
                        humidity: 32,
                        dew_point: 34.25,
                        uvi: 0.19,
                        clouds: 1,
                        visibility: 10_000,
                        wind_speed: 9.28,
                        wind_deg: 241,
                        weather: [{ id: 800, main: 'Clear', description: 'clear sky',
                                    icon: '01d' }] }],
             daily: [{ dt: 1_614_974_400,
                       sunrise: 1_614_953_781,
                       sunset: 1_614_995_562,
                       temp: { day: 73.4, min: 57.67, max: 75.4, night: 62.06, eve: 65.75,
                               morn: 57.67 },
                       feels_like: { day: 67.17, night: 56.79, eve: 58.8, morn: 53.33 },
                       pressure: 1020,
                       humidity: 20,
                       dew_point: 24.15,
                       wind_speed: 4.18,
                       wind_deg: 236,
                       weather: [{ id: 800, main: 'Clear', description: 'clear sky',
                                   icon: '01d' }] }] }

    forecast = Forecast.new(data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.current_forecast).to be_a(CurrentForecast)
  end
end
