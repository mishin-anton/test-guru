Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests, shallow: true do
    resources :questions
  end

  get 'tests/:category/:title', to: 'tests#search'
end
