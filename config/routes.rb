Rails.application.routes.draw do
  devise_for :members, controllers: { registrations: "registrations" }
  resources :members 
  get 'home/index'
  get 'home/userview'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :member do
    root to: 'home#userview', as: :authenticated_root
  end
end
