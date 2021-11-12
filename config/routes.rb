# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/vehicles', to: 'vehicles#index'

  resources :people do
    resources :vehicles, except: :index
  end

  resources :transfers, only: %i[index new create show]
end
