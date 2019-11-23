Rails.application.routes.draw do
  devise_for :users
  
  root "boards#index"

  patch 'completed_tasks_list_task/:list_id/:id', to: 'tasks#completed_tasks', as: 'completed_tasks'
  delete 'clear_tasks_list_task/:list_id/:id', to: 'tasks#clear_tasks', as: 'clear_tasks'

  resources :boards do
    resources :lists 
  end

  resources :lists do
    resources :tasks
  end
end
