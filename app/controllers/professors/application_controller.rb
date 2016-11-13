class Professors::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "application"
  before_action :authenticate_professor!
  include DeviseCustomParams

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: professors_root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= professor_signed_in? ? Ability.new(current_professor) : Ability.new(current_student)
  end
end
