Rails.application.routes.draw do
  devise_for :professors
  devise_for :students

  resources :groups
  resources :semesters

  namespace :professors do
    get 'home/index'
    root 'home#index'
  end

  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
