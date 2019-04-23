Rails.application.routes.draw do

  root 'sessions#home'

  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :coffees, only: [:index]
  end

  resources :coffees do
    resources :reviews, only: [:create]
  end

  resources :sessions, only: [:new, :create, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
