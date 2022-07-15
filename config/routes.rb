Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  }

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  root 'public/homes#top'

  namespace :admin do
    get "/"=>"homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :menus, only: [:index, :show, :destroy] do
       resources :comments, only: [:destroy]
    end
  end


  namespace :public do
    get "search" => "searches#search"
    resources :users do
      member do
       get :likes
      end
    end
    resources :menus do
       resources :likes, only: [:create, :destroy]
       resources :comments, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
