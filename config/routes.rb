Rails.application.routes.draw do

  namespace 'api' do
    namespace :v1 do
      resources :users, only: :create
      resources :sessions, only: :create
      resources :road_trip, only: :create
      get '/backgrounds', to: 'backgrounds#index'
      post '/forecast', to: 'road_trip#create'
    end
  end
end
