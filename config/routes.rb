Rails.application.routes.draw do

  resources :piers
  resources :harbours

  root 'harbours#index'

end
