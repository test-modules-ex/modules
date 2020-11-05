Rails.application.routes.draw do
  resources :learning_modules do
    post :update_popularity, to: 'learning_modules#update_popularity'
  end
  resources :categories do
    get :list, to: 'categories#list', on: :collection
  end
  root to: 'categories#list'
end
