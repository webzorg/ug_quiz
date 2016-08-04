class Professor::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'professor/application'
  before_action :authenticate_professor!
end
