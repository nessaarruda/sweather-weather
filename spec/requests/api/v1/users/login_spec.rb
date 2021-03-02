require 'rails_helper'

describe 'User login' do
  describe 'happy path' do
    it 'can log in user if credentials are good' do
      user = create(:user)

      params = {
        'email' => user.email,
        'password' => user.password
      }

      post '/api/v1/sessions', params: params

      expect(response.status).to eq(200)
      expect(response).to be_successful

      parsed = parse(response)

      expect(parsed).to be_a(Hash)
      expect(parsed[:data][:type]).to eq('user')
      expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end
end
