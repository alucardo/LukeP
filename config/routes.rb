Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    resources :users
  end
  resources :divisions
  resources :subjects
  devise_scope :user do
    authenticated do
      root 'admin/users#current_user_home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
