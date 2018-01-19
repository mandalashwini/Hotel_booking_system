Rails.application.routes.draw do
  devise_for :members
  devise_scope :members do
  get '/members/sign_out' => 'devise/sessions#destroy'
  end
  get 'home/index'
  get 'home/userview'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
