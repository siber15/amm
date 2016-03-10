Rails.application.routes.draw do

  resources :devices
  resources :slips
  resources :harbours do
    resources :piers
  end

  
  root 'harbours#index'

end
