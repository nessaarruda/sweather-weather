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
      expect(response.content_type).to eq('application/json')

      parsed = parse(response)

      expect(parsed).to be_a(Hash)
      expect(parsed[:data][:type]).to eq('users')
      expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(parsed[:data][:attributes][:email]).to eq(user.email)
      expect(parsed[:data][:attributes]).to_not have_key(:password)
      expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
    end
  end
  describe 'bad path' do
    it 'return error if bad credentials' do
      user = create(:user)

      params = {
        'email' => user.email,
        'password' => 'wrong_password'
      }

      post '/api/v1/sessions', params: params

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = parse(response)

      expect(parsed).to be_a(Hash)
      expect(parsed).to_not have_key(:data)
      expect(parsed[:error]).to eq('Invalid credentials, please try again')
    end
    it 'return error if field is blank' do
      user = create(:user)

      params = {
        'email' => '',
        'password' => 'password'
      }

      post '/api/v1/sessions', params: params

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      parsed = parse(response)

      expect(parsed).to be_a(Hash)
      expect(parsed).to_not have_key(:data)
      expect(parsed[:error]).to eq('Invalid credentials, please try again')
    end
  end
end
