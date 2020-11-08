class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:format])
  end
end
