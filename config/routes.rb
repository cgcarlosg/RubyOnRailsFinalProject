Rails.application.routes.draw do

  resources :trans
  resources :categories
  resources :users
  resources :tran_categories, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#edit'
  get 'nocateg', to: 'trans#nocateg'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :update]
end
