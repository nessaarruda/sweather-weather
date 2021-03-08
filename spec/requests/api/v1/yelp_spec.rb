require 'rails_helper'

describe 'Yelp API' do
  describe 'happy path' do
    it 'Returns forecast and opened restaurant information for specific type of food' do

      params = {
                start:        'New York, NY',
                destination:  'Los Angeles, LA',
                food:         'Mexican'
               }

      get '/api/v1/munchies', params: params

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to eq('application/json')

      parsed = parse(response)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to be_a(Hash)
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to eq(nil)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq('munchie')
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to be_a(Hash)

      yelp_details = parsed[:data][:attributes]

      expect(yelp_details).to be_a(Hash)
      expect(yelp_details).to have_key(:destination_city)
      expect(yelp_details[:destination_city]).to be_a(String)
      expect(yelp_details).to have_key(:travel_time)
      expect(yelp_details[:travel_time]).to be_a(String)
      expect(yelp_details).to have_key(:forecast)
      expect(yelp_details[:forecast]).to be_a(Hash)
      expect(yelp_details).to have_key(:restaurant)
      expect(yelp_details[:restaurant]).to be_a(Hash)

      forecast_details = yelp_details[:forecast]

      expect(forecast_details).to have_key(:summary)
      expect(forecast_details[:summary]).to be_a(String)
      expect(forecast_details).to have_key(:temperature)
      expect(forecast_details[:temperature]).to be_a(String)


      restaurant_details = yelp_details[:restaurant]

      expect(restaurant_details).to have_key(:name)
      expect(restaurant_details[:name]).to be_a(String)
      expect(restaurant_details).to have_key(:address)
      expect(restaurant_details[:address]).to be_a(String)
    end
  end
end
