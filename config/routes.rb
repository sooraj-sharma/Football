# This is the main routes file for the applicaiton.Every page in the app will have its routes configured in this class

Rails.application.routes.draw do
  devise_for :users
  resources :players
  resources :results
  resources :matches
  resources :teams
  root 'home#index'
  get 'home/match'
  get 'home/table'
  get 'home/contact'
  post "send_email", to: "home#send_email", as: :send_email
  get "contact_us", to: "home#contact", as: :contact_us

  
end
