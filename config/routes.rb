Rails.application.routes.draw do

  resources :devices
  resources :slips
  resources :piers
  resources :harbours

  root 'harbours#index'

end
