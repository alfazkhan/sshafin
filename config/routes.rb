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

  get 'message', to:'messages#new'
  post '/', to:'messages#create'
  post '/', to:'pages#create'

  get 'admin', to:'sessions#admin'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to:'sessions#delete'
  get 'sent',to:'messages#sent'
end
