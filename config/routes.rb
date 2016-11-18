Rails.application.routes.draw do
  devise_for :professors
  devise_for :students

  scope "/:locale", locale: /en|ka/ do
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
  end
end
