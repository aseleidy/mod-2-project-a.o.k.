Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  resources :destinations, only: [:index, :show, :new, :create]
  resources :places, only: [:new, :create, :show] do
    resources :comments
  end
  resources :users
  resources :itineraries do
    resources :places 
  end
  # resources :comments 
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/itineraries/:id/like', to: 'itineraries#like', as: 'itinerary_like'
  get '/destinations/:id/like', to: 'destinations#like', as: 'destination_like'
  get '/places/:id/like', to: 'places#like', as: 'place_like'
end
