Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :destinations, only: [:index, :show, :new, :create]
<<<<<<< HEAD
  resources :places, only: [:new, :create, :show] do
    resources :comments

  end
=======
  resources :places, only: [:new, :create, :show]
>>>>>>> e38e15a82210bc420770fb3c964bc517d16ad72d
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


end
