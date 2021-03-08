Rails.application.routes.draw do

  namespace 'api' do
    namespace :v1 do
      resources :users, only: :create
      resources :sessions, only: :create
      resources :road_trip, only: :create
      resources :munchies, only: :index
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'backgrounds#index'
    end
  end
end
