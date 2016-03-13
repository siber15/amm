Rails.application.routes.draw do

  resources :harbours, shallow: true do
    resources :piers do #do skal stadig neste dine routes, da du ellers ikke vil kunne finde de slips der er under en pier
      resources :slips
    end
    resources :devices
  end

  root 'harbours#index'
end
