Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :songs, only: [ :index, :new, :create, :show] do
    member do
      get :download
    end

    resources :crates, only: [:create, :show]
    resources :song_crates, only: [:create]
  end

  resources :crates, only: [:update, :edit]
  resources :user, only: [:show, :edit, :update]
end
