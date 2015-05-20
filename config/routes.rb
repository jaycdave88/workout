Rails.application.routes.draw do
  devise_for :users
  resources :workouts do
    resources :exercises
  end
  root 'workouts#index'
end
