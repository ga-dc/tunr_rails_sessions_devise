Rails.application.routes.draw do
  root to: 'artists#index'
  get '/songs', to: 'songs#index'
  get '/artists/sort', to: 'artists#sort'
  resources :artists do
    resources :songs
    resources :genres
  end
end
