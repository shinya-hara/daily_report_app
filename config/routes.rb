Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :reports do
    resources :comments, only: [:create, :destroy]
  end
  get 'users/info/:username' => 'users#show'
  root to: 'reports#index'
end
