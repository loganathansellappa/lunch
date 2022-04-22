Rails.application.routes.draw do
  resources :groups
  resources :blind_dates
  resources :restaurants
  resources :teams
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
