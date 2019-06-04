Rails.application.routes.draw do
  resources :articles
  root 'pages#index'
  get 'about', to: 'pages#about'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
