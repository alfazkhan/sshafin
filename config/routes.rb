Rails.application.routes.draw do

  resources :users , except:[:destroy,:index] do

  end

  resources :messages, except:[:update,:edit] do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  get 'message', to:'message#new'
  post '/', to:'messages#create'
  post '/', to:'pages#count'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to:'sessions#delete'
end
