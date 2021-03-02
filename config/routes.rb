Rails.application.routes.draw do

  namespace 'api' do
    namespace :v1 do
      get '/backgrounds', to: 'background#index'
    end
  end
end
