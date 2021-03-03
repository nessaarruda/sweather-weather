require 'rails_helper'

describe RoadTripService do
  # TESTS ARE OVERLAPING WITH SERVICE, ONE MUST BE WRONG
  # Sunset and sunrise return weird value
  describe 'happy path' do
    it 'return travel time for a road trip' do
      VCR.use_cassette('denver_map') do
        response = RoadTripService.trip_data('New York, NY', 'Los Angeles, CA')

        expect(response.start_city).to be_a(String)
        expect(response.end_city).to be_a(String)
        expect(response.travel_time).to be_a(String)
      end
    end
  end
  describe 'sad path' do
    xit 'invalid request' do
      VCR.use_cassette('invalid_coordinates') do
        response = RoadTripService.trip_data('avwsdfvw', 'wfgedg')
        # NEED TO SET UP CONDITIONAL, RIGHT NOW IT IS RETURING THE INVALID CITIES
        require "pry"; binding.pry
        expect(response).to be_a(RoadTrip)
      end
    end
    xit "returns 'impossible route' if roadtrip is not possible" do
      VCR.use_cassette('roadtrip_ny_london') do
        response = RoadTripService.trip_data('New York, NY', 'London, UK')
        # NEED TO SET UP CONDITIONAL, RIGHT NOW TRAVEL TIME IS NIL

        expect(response[:duration]).to eq('impossible')
        expect(response[:end_lat_lng]).to eq(nil)
      end
    end
  end
end
