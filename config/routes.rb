# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # devise_for :users, path: 'auth', path_names: {
  #   sign_in: 'login',
  #   sign_out: 'logout',
  #   password: 'secret',
  #   confirmation: 'verification',
  #   unlock: 'unblock',
  #   registration: 'register',
  #   sign_up: 'cmon_let_me_in'
  # }
end
