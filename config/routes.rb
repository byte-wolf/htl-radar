Rails.application.routes.draw do
  resources :occurrences
  get 'overview', to: 'overview#index'
  root 'overview#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
