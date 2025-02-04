require 'rails_helper'

describe 'User Registration' do
  describe 'happy path' do
    it 'creates a user in the db, and generates a unique api key for that user,' do
      headers = {
        CONTENT_TYPE: 'application/json',
        ACCEPT: 'application/json'
      }

      params = {
        email:  'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(params)

      expect(User.all.count).to eq(1)

      user = User.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq('application/json')

      parsed = parse(response)

      expect(parsed).to_not have_key(:error)
      expect(parsed).to have_key(:data)
      expect(parsed[:data][:type]).to eq('users')
      expect(parsed[:data][:id]).to eq(user.id.to_s)
      expect(parsed[:data][:attributes]).to be_a(Hash)
      expect(parsed[:data][:attributes][:email]).to eq(user.email)
      expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
      expect(parsed[:data][:attributes]).to_not have_key(:password)
      expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
    end
  end
  describe 'sad path' do
    it 'returns error message if password confirmation is not a match' do
      params = {
        email:  'user@example.com',
        password: 'password',
        password_confirmation: 'password2'
      }

      post '/api/v1/users', params: params

      expect(User.all).to eq([])
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      parsed = parse(response)

      expect(parsed).to_not have_key(:email)
      expect(parsed[:error]).to eq("Password confirmation doesn't match Password")
    end
    it 'returns error message if any field is empty' do
      params = {
        email:  '',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: params

      expect(User.all).to eq([])

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      parsed = parse(response)

      expect(parsed).to_not have_key(:email)
      expect(parsed).to_not have_key(:password)
      expect(parsed[:error]).to eq("Email can't be blank and Email invalid")
    end
    it 'returns error message if email is invalid' do
      params = {
        email:  'wefgwg',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: params

      expect(User.all).to eq([])

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      parsed = parse(response)

      expect(parsed).to_not have_key(:email)
      expect(parsed).to_not have_key(:password)
      expect(parsed[:error]).to eq('Email invalid')
    end
    it 'returns error message if email is already taken' do
      params = {
        email:  'user@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: params

      expect(User.all.count).to eq(1)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      post '/api/v1/users', params: params

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(User.all.count).to eq(1)

      parsed = parse(response)

      expect(parsed[:error]).to eq('Email has already been taken')
    end
  end
end
