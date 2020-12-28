Rails.application.routes.draw do
  root to: 'home#index'

  scope '/:locale' do
    root to: 'home#index'

    get  '/account', to: 'account#edit'
    post '/account', to: 'account#update'

    resources :sessions, only: [:new, :create, :destroy]

    resources :users, only: [:show, :new, :create, :edit, :update] do
      resources :favourites
    end

    namespace :account do
      resources :tips, only: [:index]
    end

    resources :tips do
      resources :comments, only: [:create]
    end

    get 'login',  to: 'sessions#new'
    get 'logout', to: 'sessions#destroy'
    get 'signup', to: 'users#new'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
