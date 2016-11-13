class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_student!
  include DeviseCustomParams

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_student)
  end
end
