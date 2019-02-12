Rails.application.routes.draw do
  resources :messages
  resources :messages, except:[:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'message', to:'message#new'
  post '/', to:'messages#create'
  #get 'bye', to:'sessions#delete'
end
