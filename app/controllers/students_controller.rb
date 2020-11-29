class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
  end

  def activate
    set_student.active == false ? set_student.active = true : set_student.active = false
    set_student.save
    # head :ok
    # render :nothing => true
    redirect_to student_path(set_student.id)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
