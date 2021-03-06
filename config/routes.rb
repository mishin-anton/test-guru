Rails.application.routes.draw do

  scope "(:lang)", lang: /en|ru/ do

    root to: 'tests#index'

    devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

    resources :tests, only: :index do

      member do
        post :start
      end
    end

    resources :user_tests, only: %i[show update] do
      member do
        get :result
        post :gist
      end
    end

    namespace :admin do
      resources :gists, only: :index
      resources :bages
      resources :tests do
        patch :update_inline, on: :member

        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
    end

    resources :posts, shallow: true

    resources :bages, shallow: true
    resources :bage_passages, only: :index

  end

end
