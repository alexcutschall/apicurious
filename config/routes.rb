Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/users/:username', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end