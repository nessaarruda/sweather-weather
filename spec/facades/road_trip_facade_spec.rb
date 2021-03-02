require 'rails_helper'

describe 'Road Trip Facade' do
  it 'returns road trip details based on start_city and end_city' do
    VCR.use_cassette('route_ny_la') do

      user = create(:user)

      details = RoadTripFacade.get_data('New York, NY', 'Los Angeles, CA')

      expect(details).to be_a(RoadTrip)
      expect(details.start_city).to eq('New York, NY')
      expect(details.end_city).to eq('Los Angeles, CA')
      expect(details.travel_time).to be_a(String)
    end
  end
end
