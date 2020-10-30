Rails.application.routes.draw do

   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'
   
   get '/signup', to: 'users#new'
   
   post '/signup', to: 'users#create'
   
   get '/', to: 'sessions#welcome'
   
   get 'authorized', to: 'sessions#page_requires_login'
   
   delete '/logout', to: 'sessions#destroy'
   
   get '/auth/github/callback', to: 'sessions#create'

   resources :parts
   resources :songs  do
      resources :lyrics 

   end


   get '/search', to: 'songs#search'
   end

