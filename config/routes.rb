Rails.application.routes.draw do

  namespace 'api' do
    namespace :v1 do
      get '/backgrounds', to: 'backgrounds#index'
    end
  end
end
