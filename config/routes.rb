Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post '/articles' => 'articles#create', as: 'create_article'
  # get '/articles/:id/edit' => "articles#edit", as: 'edit_article' 
  # get '/articles/:id' => "articles#show", as: 'show_article'
  root 'pages#home'

  get '/categories/:category_id/tasks_today' => "tasks#tasks_today", as: 'show_tasks_today'
  
  resources :categories do
    resources :tasks
  end
  
  resources :articles do
    resources :comments
  end

end
