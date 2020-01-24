Rails.application.routes.draw do
  root :to => 'products#index'
  resources :products do
    resources :reviews, except: [:destroy, :update]
  end

  resources :users, except: [:destroy]

  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

end
