Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
