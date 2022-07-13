Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root to: "posts#index"
  get "/comments", to: "comments#index"
  get "/mypage", to: "posts#mypage"
  get "/users", to: "users#index"
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