Rails.application.routes.draw do
  resources :admins
  resources :messages, except:[:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'bye', to:'sessions#delete'
end
