Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions
  end

  # /tests/backend/ruby
  get 'tests/:category/:title', to: 'tests#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tests

  # resource :account

  # resources :account, controller: :account

  # resources :tests, only: %i[index show]

  # resources :tests do
  #   resources :questions
  # end

  # resources :tests do
  #   resources :questions, shallow: true
  # end

  # GET /tests/beginner
  # POST /tests/1/start

  # resources :tests do
  #   get :beginner, on: :collection

  #   member do
  #     post :start
  #   end
  # end
  # get '/tests/:id/start', to: 'tests#start'

  # get 'tests/:id/start', to: 'tasks#start'

end
