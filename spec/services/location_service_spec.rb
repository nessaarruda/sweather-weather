require 'rails_helper'

describe LocationService do
  it 'can return the lat and long for a city' do
    VCR.use_cassette('geocode_denver') do
      response = LocationService.coords('Denver, CO')

      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Numeric)
      expect(response).to have_key(:lon)
      expect(response[:lon]).to be_a(Numeric)
    end
  end
end
