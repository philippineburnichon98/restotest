Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    member do
      post 'toggle_favorite', to: "restaurants#toggle_favorite"
    end
  end
end
