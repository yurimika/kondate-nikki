Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root 'public/homes#top'
  namespace :public do
    get "search" => "searches#search"
    resources :users, only:[:show, :edit, :update]
    resources :menus
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
