Rails.application.routes.draw do
  devise_for :users
  
  root "boards#index"

  post 'completed_list_task/:id/:task_id', to: 'tasks#completed', as: 'completed'

  resources :boards do
    resources :lists 
  end

  resources :lists do
    resources :tasks
  end
end
