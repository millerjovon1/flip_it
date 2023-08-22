Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :songs, only: [ :index, :new, :create] do
    member do
      get :download
    end
    resources :crate_songs, only: [:create]
  end

  resources :crates, only: [:new, :create, :show, :update, :edit]
  resources :user, only: [:show, :edit, :update]
end
