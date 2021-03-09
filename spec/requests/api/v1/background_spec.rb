require 'rails_helper'

describe 'Background image', type: :request do
  describe 'happy path' do
    it 'returns background image for a location' do
      headers = {
        CONTENT_TYPE: 'application/json',
        ACCEPT: 'application/json'
      }

      VCR.use_cassette('denver_background_first') do
        params = { location: 'Denver, Co' }

        get '/api/v1/backgrounds', headers: headers, params: params

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.content_type).to eq('application/json')

        parsed = parse(response)

        data = parsed[:data]

        expect(parsed).to have_key(:data)
        expect(data).to be_a(Hash)

        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq('background')

        attributes = data[:attributes]

        expect(attributes).to be_a(Hash)
        expect(attributes).to have_key(:image_url)
        expect(attributes[:image_url]).to be_a(String)
        expect(attributes).to have_key(:location)
        expect(attributes[:location]).to be_a(String)
        expect(attributes[:location]).to eq(params[:location])
        expect(attributes).to have_key(:credit)
        expect(attributes[:credit]).to be_a(String)
        expect(attributes).to_not have_key(:total)
        expect(attributes).to_not have_key(:total_pages)
        expect(attributes).to_not have_key(:results)
      end
    end
  end
  describe 'sad path' do
    it 'returns error if location is not provided' do
      headers = {
        CONTENT_TYPE: 'application/json',
        ACCEPT: 'application/json'
      }
      VCR.use_cassette('no_background_image') do
        params = { location: '' }

        get '/api/v1/backgrounds', headers: headers, params: params

        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(response.body).to eq('Invalid request')
      end
    end
    # xit 'returns error if location is invalid' do
    #   headers = {
    #     CONTENT_TYPE: 'application/json',
    #     ACCEPT: 'application/json'
    #   }
    #
    #   VCR.use_cassette('no_background') do
    #     params = { location: 'rdsjnto6z' }
    #
    #     get '/api/v1/backgrounds', headers: headers, params: params
    #
    #     expect(response).to_not be_successful
    #     expect(response.status).to eq(400)
    #     expect(response.body).to eq('Invalid request')
    #   end
    # end
  end
end
