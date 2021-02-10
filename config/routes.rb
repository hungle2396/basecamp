Rails.application.routes.draw do
  root to: 'pages#home'
  get 'welcome/index'
  get "how-it-works", to: "pages#how_it_works"
  get "before-after", to: "pages#before_after"
  get "got-clients", to: "pages#got_clients"
  get "pricing", to: "pages#pricing"
  get "support", to: "pages#support"

  devise_for :users
  resources :users, except: [:edit, :update] do
    member do
      post "makeAdmin"
      post "removeAdmin"
    end
  end
  resources :projects do
    resources :discussions
  end

  resources :discussions do
    resources :comments do 
      post 'comments', to: 'comments#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
