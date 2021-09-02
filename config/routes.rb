Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show  do
      resources :answers, shallow: true, only: :show
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root 'tests#index'
    resources :gists, only: :index
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
