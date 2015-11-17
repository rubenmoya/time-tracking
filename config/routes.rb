Rails.application.routes.draw do

  root 'projects#index'

  get '/contact' => 'site#contact'

  resources :projects
  resources :entries
end
