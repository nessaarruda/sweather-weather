require 'rails_helper'

describe 'Background Facade' do
  describe 'happy path' do
    it 'returns an image based on location' do
      VCR.use_cassette('denver_background_image') do
        image = BackgroundFacade.get_background('Denver, Co')

        expect(image).to be_a(Background)
        expect(image.image_url).to be_a(String)
        expect(image.credit).to be_a(String)
        expect(image.location).to be_a(String)
      end
    end
  end
  describe 'sad path' do
    it ' returns empty array if no image is found' do
      VCR.use_cassette('no_background') do
        background = BackgroundFacade.get_background('seadfvqwa')

        expect(background).to be_a(Hash)

        expect(background).to have_key(:total)
        expect(background[:total]).to eq(0)

        expect(background).to have_key(:total_pages)
        expect(background[:total_pages]).to eq(0)

        expect(background).to have_key(:results)
        expect(background[:results]).to eq([])
      end
    end
  end
end
