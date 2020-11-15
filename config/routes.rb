Rails.application.routes.draw do
  get 'questions/show'
  get 'questions/new'
  get 'questions/edit'
  devise_for :users
  resources :users
  resources :pets do
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
