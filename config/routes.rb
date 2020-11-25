Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :categories
  resources :pets do
    resources :post_comments, only: [:create, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
    resources :questions
  end

  # details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
