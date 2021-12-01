Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post '/articles' => 'articles#create', as: 'create_article'
  # get '/articles/:id/edit' => "articles#edit", as: 'edit_article' 
  # get '/articles/:id' => "articles#show", as: 'show_article'
  root 'pages#home'
  
  resources :categories do
    resources :tasks
  end
  
  resources :articles do
    resources :comments
  end

end
