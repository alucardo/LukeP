Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions" }
  namespace :admin do
    resources :users
  end
  resources :divisions
  resources :subjects
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
