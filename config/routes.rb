Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "messages#index"

  resources :messages, only: [:index, :new, :create, :show] do 
    collection do
      get 'search'
    end

    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
    
  end

  resources :messages, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:edit, :update]
end
