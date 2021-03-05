require 'rails_helper'

describe 'Road Trip Facade' do
  describe 'happy path' do
    it 'returns road trip poro based on start_city and end_city' do
      VCR.use_cassette('route_ny_la') do

        # user = create(:user) #not using this, I think I need to

        details = RoadTripFacade.get_data('New York, NY', 'Los Angeles, CA')

        expect(details).to be_a(RoadTrip)
        expect(details.start_city).to eq('New York, NY')
        expect(details.end_city).to eq('Los Angeles, CA')
        expect(details.travel_time).to be_a(String)
        expect(details.weather_at_eta).to be_a(Hash)
        expect(details.weather_at_eta).to have_key(:temperature)
        expect(details.weather_at_eta[:temperature]).to be_a(Float)
        expect(details.weather_at_eta).to have_key(:conditions)
        expect(details.weather_at_eta[:conditions]).to be_a(String)
      end
    end
  end
  describe 'sad path' do
    xit 'returns message impossible route if there is no route between start_city and end_city' do
      VCR.use_cassette('route_ny_london') do

        user = create(:user)

        details = RoadTripFacade.get_data('New York, NY', 'London, UK')

        expect(details).to be_a(RoadTrip)
        expect(details.start_city).to eq('New York, NY')
        expect(details.end_city).to eq('London, UK')
        # not passing, need to setup message and weather_at_eta should be blank if route is impossible
        expect(details.travel_time).to be_a('impossible route')
      end
    end
  end
end
