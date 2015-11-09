Rails.application.routes.draw do
  get '/artists/testing_session', to: 'artists#testing_session'
  get '/artists/deleting_session', to: 'artists#deleting_session'
  root to: 'artists#index'
  get '/songs', to: 'songs#index'
  resources :artists do
    resources :songs
    resources :genres
  end
end
