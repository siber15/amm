Rails.application.routes.draw do

  resources :users
  resources :harbours, shallow: true do
    resources :piers do #do skal stadig neste dine routes, da du ellers ikke vil kunne finde de slips der er under en pier
      resources :slips
    end
  end

  resources :stations
  resources :devices do
    #route to batch add as a collection
    collection do
      post :batch_add
    end
  end

  root 'harbours#index'
end
