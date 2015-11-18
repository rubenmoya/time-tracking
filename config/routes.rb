Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :entries, only: [:create, :edit, :new, :update, :destroy]
  end
end
