Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  resources :users do
    resources :followings, controller: 'users/followings'
    resources :followers, controller: 'users/followers'
  end
  root to: 'books#index'
  resources :books
  resources :friendships, only: [:create, :destroy]
end
