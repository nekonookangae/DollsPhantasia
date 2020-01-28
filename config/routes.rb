Rails.application.routes.draw do
  root 'posts#index'
  # archive
  get '/posts/archive/:yyyymm', to: 'posts#archive', as: :archive_posts
  resources :posts
  resources :categories, only: [:show]
end
