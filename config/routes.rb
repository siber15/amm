Rails.application.routes.draw do

  resources :slips
  resources :piers
  resources :harbours

  root 'harbours#index'

end
