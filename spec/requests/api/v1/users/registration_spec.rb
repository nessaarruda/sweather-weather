require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'happy path' do
    it 'lets users register' do
      params = {
        email:  'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: params

      expect(User.all.count).to eq(1)

      user = User.last

      expect(response.status).to eq(201)
      expect(response).to be_successful

      parsed = parse(response)

      expect(parsed).to_not have_key(:error)
      expect(parsed).to have_key(:data)
      expect(parsed[:data][:type]).to eq('user')
      expect(parsed[:data][:id]).to eq(user.id.to_s)
      expect(parsed[:data][:attributes]).to be_a(Hash)
      expect(parsed[:data][:attributes][:email]).to eq(user.email)
      expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end
end
