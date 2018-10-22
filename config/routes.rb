Rails.application.routes.draw do
  root "welcome#show"
  
  get '/signup', to: "registration#new"
  post '/signup', to: "registration#create"

  get 'login', to: "session#new"
  post '/login', to: "session#create" 
  delete '/logout', to: "session#destroy"

  # get 'users/:id', to: "users#show", as: "profile"

  resources :gamerooms, param: :token do
    member do
      post 'join'
    end
  end
  
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end