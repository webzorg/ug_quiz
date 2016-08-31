class Professors::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'professors/application'
  before_action :authenticate_professor!
  include DeviseCustomParams
end

# <%= f.select :sport_id, options_for_select(Sport.all.map{|s|[s.name, s.id]}) %>
#
# <%= f.collection_select :student_ids, Student.all, :name, :id, multiple: true %>
#
# <%= f.select :student_ids, options_from_collection_for_select(Student.all ...
