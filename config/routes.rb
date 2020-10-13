Rails.application.routes.draw do
  resources :users, only: [:new, :create,]
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   get 'welcome', to: 'sessions#welcome'
   get 'authorized', to: 'sessions#page_requires_login'
   delete '/session', to:'sessions#destroy'
   get '/auth/facebook/callback' => 'sessions#create'
end