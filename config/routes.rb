Rails.application.routes.draw do

  resources :devices, :slips
  resources :harbours do
    resources :piers
  end

  resources :piers do
    resources :slips
  end
  root 'harbours#index'

end
