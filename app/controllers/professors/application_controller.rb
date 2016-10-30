class Professors::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'professors/application'
  before_action :authenticate_professor!
  include DeviseCustomParams
end
