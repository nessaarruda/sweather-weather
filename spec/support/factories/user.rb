FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    api_key { 'api_key' }
    password { 'password'}
    password_confirmation { 'password'}
  end
end
