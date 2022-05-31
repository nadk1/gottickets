Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :events, only: %i[index new create] do
    resources :reviews, only: %i[index new create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: :show
  resources :reviews, except: %i[index new create destroy]
  resources :categories, only: :index
end
