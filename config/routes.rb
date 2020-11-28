Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :categories
  root  :to => "pets#top"
  resources :pets do
    resources :post_comments, only: [:create, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
    resources :favorites, only: [:create, :destroy]
    resources :questions
  end

  # details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
