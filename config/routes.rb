Rails.application.routes.draw do
  get 'booking/roomBook'

  get 'search/searchView'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members, controllers: { registrations: "registrations" }
  resources :members 
  resources :search
  resources :booking
  get 'booking/roomBook'
  get 'search/show'
  get 'home/index'
  get 'home/search_index'
  get 'home/userview'
  root 'home#search_index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :member do
    root to: 'home#userview', as: :authenticated_root
  end
end
