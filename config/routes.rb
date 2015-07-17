Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    resources :users
  end
  devise_scope :user do
    authenticated :user do
      root 'admin/users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
