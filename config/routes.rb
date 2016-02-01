Rails.application.routes.draw do

  resources :drops

  resources :friendships
resources :assets
  resources :projects do 
  resources :assets
   end


  root 'users#index'

  devise_for :users

  resources :welcome
  resources :users, only: [:show, :index, :edit, :update]

  match 'assets/get/:project_id' => 'assets#get', as: 'download', via: :get
end
