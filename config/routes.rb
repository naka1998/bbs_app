Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :topics, only: [:index, :show, :new, :create, :edit, :update, :destroy], shallow: true do
    resources :posts, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
