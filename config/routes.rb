Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/forbidden'
  get 'errors/internal_server_error'
  api_version(:module => "V1", :path => {:value => "api/v1"}) do #, :defaults => {:format => :json}
    resources :occurrences
  end
  resources :occurrences

  resources :sessions, only: [:create]
  delete "/sessions/dismiss", to: "sessions#logout"
  get "/sessions/check", to: "sessions#logged_in"

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  get '/register', to: 'users#new'

  get 'logged_in', to: 'sessions#logged_in'

  resources :registrations, only: [:create]

  get 'overview', to: 'overview#index'
  root 'overview#index'

  match '/403', to: 'errors#forbidden', via: :get
  match '/404', to: 'errors#not_found', via: :get
end
