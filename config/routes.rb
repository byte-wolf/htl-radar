Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "api/v1"}, :defaults => {:format => :json}) do
    resources :occurrences
    end
  resources :occurrences
  get 'overview', to: 'overview#index'
  root 'overview#index'
end
