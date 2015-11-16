Rails.application.routes.draw do

  get '/contact' => 'site#contact'

  root 'site#home'
end
