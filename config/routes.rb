Rails.application.routes.draw do
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   
   get '/users/new', to: 'users#new'
   
   post '/users', to: 'users#create'
   
   get '/', to: 'sessions#welcome'
   
   get 'authorized', to: 'sessions#page_requires_login'
   
   delete '/logout', to:'sessions#destroy'
   
   get '/auth/facebook/callback' => 'sessions#create'

   resources :parts, only: :index
   resources :songs, only: [:index, :create, :new] do
      resources :lyrics, only: [:index, :new] 
end
resources :lyrics, only: :create
end