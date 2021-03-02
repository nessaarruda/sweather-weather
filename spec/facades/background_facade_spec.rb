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
end
