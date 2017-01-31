class ReportsController < ApplicationController
  before_action :set_semester, only: [:show, :by_groups, :by_students]
  skip_before_action :authenticate_student!

  def index
    @semesters = Semester.all.newest_first
  end

  def show
  end

  def by_groups
    @groups = @semester.courses_semesters.collect(&:groups).flatten
  end

  def by_students
    @students = @semester.courses_semesters.collect(&:groups).flatten.collect(&:students).flatten.uniq
  end

  private

    def set_semester
      @semester = Semester.find(params[:id])
    end
end
