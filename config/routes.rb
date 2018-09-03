Rails.application.routes.draw do
  root :to => 'static_pages#home'
  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :submissions
    # get 'submissions/submit'
    post 'submissions/:id', to: 'submissions#status_change'
  

  
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/submit'
  get 'static_pages/login'
  get 'static_pages/approved_index', to: 'submissions#approved_index'
  get 'static_pages/approved_month', to: 'submissions#approved_month'
  get 'static_pages/archive', to: 'submissions#archive'
  get 'static_pages/all', to: 'submissions#get_all'
   
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
