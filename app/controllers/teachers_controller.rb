class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:format])
    @teacher_evaluations = Teacher.find(params[:format]).teacher_evaluations
  end
end
