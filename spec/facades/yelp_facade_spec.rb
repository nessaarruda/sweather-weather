require 'rails_helper'

describe 'Yelp Facade' do
  describe 'happy path' do
    it 'returns yelp poro based on start_city, end_city and food' do
      VCR.use_cassette('yelp_denver_pueblo') do

        details = YelpFacade.food('denver, co', 'pueblo, co', 'hamburger')

        expect(details).to be_a(Food)
        expect(details.destination_city).to be_a(String)
        expect(details.destination_city).to eq('pueblo, co')
        expect(details.forecast).to be_a(Hash)
        expect(details.forecast[:temperature]).to be_a(Float)
        expect(details.forecast[:conditions]).to be_a(String)
        expect(details.restaurant).to be_a(Hash)
        expect(details.restaurant[:name]).to be_a(String)
        expect(details.restaurant[:address]).to be_a(String)
        expect(details.travel_time).to be_a(String)
      end
    end
  end
end
