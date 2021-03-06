Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "messages#index"

  resources :messages do
    collection do
      get 'search'
    end

    resources :comments, only: :create

    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
  end

  resources :users, only: [:edit, :update]
end
