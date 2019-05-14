Rails.application.routes.draw do

    root 'sessions#home'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    delete '/logout' => 'sessions#destroy'

    get '/auth/facebook/callback' =>  'sessions#fbcreate'


  resources :users do
    resources :coffees
  end

  resources :coffees do
  collection do
    get :coffee_origin
    get :reviewed
  end
  resources :reviews,  :except => [:index]

  end









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
