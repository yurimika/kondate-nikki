Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root 'public/homes#top'
  namespace :public do
    get "search" => "searches#search"
    resources :users do
      member do
       get :likes
      end
    end
    resources :menus do
       resources :likes, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
