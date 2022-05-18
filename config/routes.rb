Rails.application.routes.draw do

  # devise_for :users#, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }

  root "articles#index"

  post "like/:record_type/:record_id", to: "likes#like_toggle", as: "like_record"

  resources :articles do
    resources :comments
  end
end
