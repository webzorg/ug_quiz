Rails.application.routes.draw do
  devise_for :professors
  devise_for :students

  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/, defaults: { locale: "ka" } do
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

  # professors namespace root shortcut
  get "/pro", to: "professors/home#index"

  # fallback to root if locale param is missing
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
end
