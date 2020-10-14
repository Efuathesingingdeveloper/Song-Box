Rails.application.routes.draw do
  resources :users, only: [:new, :create,]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   #index
get '/songs', to: 'songs#index'
#new
get 'songs/new', to: 'songs#new'
#show
get '/songs/:id', to: 'songs#show', as: 'song'
#create
post '/songs', to:"song#create"
#edit
get '/songs/:id/edit', to:'songs#edit'
#update
patch '/songs/:id/edit', to: 'songs#update'
   post '/users', to: 'users#create'

   get 'welcome', to: 'sessions#welcome'

   get 'authorized', to: 'sessions#page_requires_login'

   delete '/logout', to:'sessions#destroy'

   get '/auth/facebook/callback' => 'sessions#create'
end