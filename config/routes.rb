Rails.application.routes.draw do
  # letterOpenerWeb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"

  resources :users, only: %i[index new create edit update]
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]
  resource :care_persons, only: %i[new create show edit update]
  resources :posts do
    resources :comments, only: %i[edit create destroy update]
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

end
