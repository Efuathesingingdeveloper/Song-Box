Rails.application.routes.draw do

   get '/users/new', to: 'sessions#new'
   post '/users/new', to: 'sessions#create'
   
   get '/signup', to: 'users#new'
   
   post '/signup', to: 'users#create'
   
   get '/', to: 'sessions#welcome'
   
   get 'authorized', to: 'sessions#page_requires_login'
   
   get '/logout', to:'sessions#destroy'
   
   get '/auth/facebook/callback' => 'sessions#create'

   resources :parts, only: [:index, :create, :new]
   resources :songs, only: [:index, :create, :new] do
      resources :lyrics, only: [:index, :new] 
   end
   resources :lyrics, only: [:create]
   get '/songs/search', to:'songs#search', as: 'songs_search_path'
end