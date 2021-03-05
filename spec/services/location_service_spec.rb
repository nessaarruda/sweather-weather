require 'rails_helper'

describe LocationService do
  describe 'happy path' do
    it 'can return the lat and long for a city' do
      VCR.use_cassette('geocode_denver') do
        response = LocationService.coords('Denver, CO')

        expect(response).to have_key(:lat)
        expect(response[:lat]).to be_a(Numeric)
        expect(response).to have_key(:lon)
        expect(response[:lon]).to be_a(Numeric)
      end
    end
  describe 'sad paths' do
    xit 'error if city provided is invalid' do
      VCR.use_cassette('route_no_match_cities') do
        response = LocationService.coords('saedfvwe')

        expect(response).to have_key(:error)
        expect(response[:error]).to be_a(String)
      end
    end
  end
end
end
