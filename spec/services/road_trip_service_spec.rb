require 'rails_helper'

describe RoadTripService do
  it 'return travel time for a road trip' do
    VCR.use_cassette('denver_map') do
      response = RoadTripService.trip_data('New York, NY', 'Los Angeles, CA')

      expect(response).to be_a(Hash)
      expect(response[:route][:formattedTime]).to be_a(String)
    end
  end
end
