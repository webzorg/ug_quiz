class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_student!
  before_action :set_locale

  include DeviseCustomParams

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_back fallback_location: root_path, alert: exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_student)
  end
end
