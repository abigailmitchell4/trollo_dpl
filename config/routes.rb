Rails.application.routes.draw do
  devise_for :users
  
  root "boards#index"

  patch 'completed_list_task/:list_id/:id', to: 'tasks#completed', as: 'completed'

  resources :boards do
    resources :lists 
  end

  resources :lists do
    resources :tasks
  end
end
