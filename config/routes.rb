Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :events, only: %i[index new create] do
    resources :bookings, only: %i[new create]
      # resources :reviews, only: %i[index new create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, only: :show
  resources :reviews, except: %i[index new create]
  resources :categories, only: :index
  resources :bookings, except: %i[new create] do
    resources :reviews, only: %i[index new create]
  end

end
