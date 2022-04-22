Rails.application.routes.draw do
  root 'employees#index'
  resources :groups
  resources :blind_dates
  resources :restaurants
  resources :teams
  resources :employees
end
