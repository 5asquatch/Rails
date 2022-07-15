Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root to: "posts#index"
  get "/users", to: "users#index"
  get "users/:id", to: "users#user", as: "user"
  resources :users
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  # 'method' 'url', to: 'controller_name#method', as: 'name_path'
  #delete "/post:id/comment:id" to: "CommentsController",  as: comment_destroy_path
  delete "/posts:id", to: "likes#destroy"
  resources :posts do
    resources :likes 
    resources :comments, only: [:create, :destroy, :edit]
  end
end