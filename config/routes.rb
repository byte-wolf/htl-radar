Rails.application.routes.draw do
  ### Errors
  get 'errors/not_found'
  get 'errors/forbidden'
  get 'errors/internal_server_error'

  ### API
  api_version(:module => "V1", :path => {:value => "api/v1"}) do #, :defaults => {:format => :json}
    resources :occurrences
  end

  ### Resources

  root 'overview#index'
  get 'overview', to: 'overview#index'

  resources :occurrences
  get '/occurrences_compact', to: 'occurrences#compact'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  get '/register', to: 'users#new'


  ### Error Pages
  match '/403', to: 'errors#forbidden', via: :get
  match '/404', to: 'errors#not_found', via: :get

  # resources :sessions, only: [:create]
  # delete "/sessions/dismiss", to: "sessions#logout"
  # get "/sessions/check", to: "sessions#logged_in"
end
