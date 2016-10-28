Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :quizzes do
    patch 'toggle_quiz', on: :member
  end
  resources :groups
  resources :semesters

  devise_for :professors
  devise_for :students

  namespace :professors do
    get 'home/index'
    root 'home#index'
  end

  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
