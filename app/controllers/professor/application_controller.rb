class Professor::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  render 'layouts/professor/application'
  before_action :authenticate_professor!
  before_action do
    redirect_to :new_professor_session_path unless current_professor
  end
end
