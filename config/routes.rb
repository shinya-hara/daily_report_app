Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :reports
  get 'users/info/:username' => 'users#show'
  root to: 'reports#index'
end
