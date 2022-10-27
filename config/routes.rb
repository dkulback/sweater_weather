require 'sidekiq/web'

Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  draw :sidekiq
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#index'
      get '/book-search', to: 'book_search#index'
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'road_trip#create'
      resources :users, only: [:create]
    end
  end
end
