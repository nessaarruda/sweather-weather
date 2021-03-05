require 'rails_helper'

describe BackgroundService do
  describe 'happy path' do
    it 'can return the lat and lng for a city' do
      VCR.use_cassette('denver_background') do
        response = BackgroundService.get_image('Denver, CO')

        expect(response[:results]).to be_an(Array)
        expect(response[:results][0]).to be_a(Hash)
        expect(response[:results][0][:description]).to be_a(String)
        expect(response[:results][0][:urls][:full]).to be_a(String)
      end
    end
  end
  describe 'sad path' do
    it 'no backgrounds found' do
      VCR.use_cassette('no_background)found') do
        response = BackgroundService.get_image('swerhaqerw')

        expect(response).to be_a(Hash)
        # testing this in the facade level, either service or facade test is wrong
        expect(response).to have_key(:total)
        expect(response[:total]).to eq(0)

        expect(response).to have_key(:total_pages)
        expect(response[:total_pages]).to eq(0)

        expect(response).to have_key(:results)
        expect(response[:results]).to eq([])
      end
    end
  end
end
