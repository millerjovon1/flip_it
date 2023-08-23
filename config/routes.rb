Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/search", to: "pages#search", as: "search"
  resources :songs, only: [ :index, :new, :create, :show] do
    member do
      get :download
    end
    resources :crate_songs, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :crates, only: [:new, :create, :show, :update, :edit]

end
