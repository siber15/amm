Rails.application.routes.draw do

  resources :devices
  resources :slips
  resources :harbours do
    resources :piers do
      resources :slips
    end
  end
  
  root 'harbours#index'

end
