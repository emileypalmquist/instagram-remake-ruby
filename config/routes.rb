Rails.application.routes.draw do

  resources :comments
  resources :likes
  resources :posts
  resources :saved_posts
  resources :follows
  resources :users

  get '/', to: 'welcome#index', as: 'welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
