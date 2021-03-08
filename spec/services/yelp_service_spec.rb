require 'rails_helper'

describe 'Yelp Service' do
  describe 'happy path' do
    it 'returns details based on food, destination and time of arrival' do
      VCR.use_cassette('pueblo_yelp') do

        response = YelpService.get_food_data('hamburger', 'pueble,co', 1615231805)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:businesses)
        expect(response[:businesses]).to be_a(Array)
        expect(response[:businesses][0]).to have_key(:name)
        expect(response[:businesses][0][:name]).to be_a(String)
        expect(response[:businesses][0]).to have_key(:categories)
        expect(response[:businesses][0][:categories]).to be_an(Array)
        expect(response[:businesses][0][:categories][0]).to have_key(:title)
        expect(response[:businesses][0]).to have_key(:location)
        expect(response[:businesses][0][:location]).to have_key(:address1)
        expect(response[:businesses][0][:location][:address1]).to be_a(String)
      end
    end
  end
end
