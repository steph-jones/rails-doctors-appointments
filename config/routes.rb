Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'doctors#index'
  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
