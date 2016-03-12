Rails.application.routes.draw do

  resources :harbours, shallow: true do
    resources :piers
    resources :slips
    resources :devices
  end

  root 'harbours#index'
end
