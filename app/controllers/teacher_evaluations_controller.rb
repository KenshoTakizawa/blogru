class TeacherEvaluationsController < ApplicationController
  before_action :do_sign
  before_action :only_user

  def new
    @teacher_evaluation = TeacherEvaluation.new
  end

  def create
    @teacher_evaluation = TeacherEvaluation.new(evaluation_params)
    @teacher = Teacher.find(params[:teacher_id])
    if @teacher_evaluation.save!
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def do_sign
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def only_user
    if current_teacher
      redirect_to root_path
    end
  end

  def evaluation_params
    params.require(:teacher_evaluation).permit(:review, :rate).merge(user_id: current_user.id, teacher_id: params[:teacher_id])
  end

end
