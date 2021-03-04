require 'rails_helper'
describe CurrentForecast do
  describe 'happy path' do
    xit 'exists and has attributes' do
      # doesnt look like a poro test, I think Im sending the poro the wrong structure


      forecast = Forecast.new(current, daily, hourly)

      expect(forecast).to be_a(Forecast)
      expect(forecast.id).to eq(nil)
    end
  end
  describe 'sad path' do
    xit '' do
    end
  end
end
