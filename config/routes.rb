Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/hi', to:'welcome#index'
  resources :articles do
    resources :comments
  end
  # The Past Line Equals These 7 Lines
  # get 'articles', to: 'articles#index'
  # get 'articles/new', to: 'articles#new'
  # post 'articles', to: 'articles#create'
  # get 'articles/:id/edit', to: 'articles#edit'
  # put 'articles/:id', to: 'articles#edit'
  # get 'articles/:id', to: 'articles#show'
  # delete 'articles/:id', to: 'articles#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
