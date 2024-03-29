Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'teachers/show'
  devise_for :teachers, controllers: {
    sessions:      'teachers/sessions',
    passwords:     'teachers/passwords',
    registrations: 'teachers/registrations'
  }
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controller: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :teachers, only: [:show] do
    resources :orders, only:[:index, :create, :destroy, :show]
    resources :teacher_evaluations, only:[:new, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    
    resources :comments, only: [:create, :destroy]
    resources :teacher_comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end




  resources :notifications, only: :index
  delete :notifications, to: 'notifications#destroy_all'

  resources :profiles do
    get 'user_index'
  end

  resources :tutorials
  resources :tips
end
