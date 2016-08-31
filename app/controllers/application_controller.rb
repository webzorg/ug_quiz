class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_student!
  include DeviseCustomParams
end
