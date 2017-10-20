Rails.application.routes.draw do

  resources :chatrooms, only: [:index, :new, :create, :show]
  mount ActionCable.server => "/cable"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
