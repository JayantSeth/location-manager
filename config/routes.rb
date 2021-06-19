Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root 'welcome#index'
  resources :location_types
  resources :location_contacts
  resources :locations 
  resources :location_ip_schemas
  get '/search_location_for_ip', to: 'location_ip_schemas#search', as: 'search_location_for_ip'
  post '/location_ip_schemas_controller/find_location', to: 'location_ip_schemas#find_location', as: 'find_location'
end
