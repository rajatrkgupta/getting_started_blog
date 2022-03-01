Rails.application.routes.draw do

  # devise_for :users#, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }

  root "articles#index"

  resources :articles do
    resources :comments
    member do
      post :like_toggle
    end
  end
end
