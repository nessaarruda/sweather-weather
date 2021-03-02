require 'rails_helper'

describe 'Background image', type: :request do
  describe 'happy path' do
    it 'returns background image for a location' do
      headers = {
                'CONTENT_TYPE' => 'application/json',
                'ACCEPT' => 'application/json'
                }
      VCR.use_cassette('denver_background_image') do
        params = { location: 'Denver, CO' }

      get 'api/v1/backgrounds', headers: headers, params: params

      expect(response).to be_successful

      parsed = parse(response)

      data = parsed[:data]

      expect(parsed).to have_key(:data)
      expect(data).to be_a(Hash)

      null = nil

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(null)

      expect(data).to have_key(:type)
      expect(data[:type]).to eq('image')

      attributes = data[:attributes]

      expect(attributes).to be_a(Hash)

      expect(attributes).to have_key(:image)
      expect(attributes[:image]).to be_a(Hash)

      expect(attributes[:image]).to have_key(:image_url)
      expect(attributes[:image_url]).to be_a(String).or eq(null)

      expect(attributes[:image]).to have_key(:location)
      expect(attributes[:image][:location]).to be_a(String)
      expect(attributes[:image][:location]).to eq(params[:location])

      expect(attributes[:image]).to have_key(:credit)
      expect(attributes[:image][:credit]).to be_a(Hash)

      expect(attributes[:image][:credit]).to have_key(:author)
      expect(attributes[:image][:credit][:author]).to be_a(String)
      end
    end
  end
end
