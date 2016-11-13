Rails.application.routes.draw do
  devise_for :professors
  devise_for :students

  namespace :professors do
    resources :professors
    resources :students
    get "home/index"
    root "home#index"
  end

  resources :answers
  resources :questions
  resources :quizzes do
    patch "toggle_quiz", on: :member
  end
  resources :groups
  resources :semesters

  resources :attempts
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
