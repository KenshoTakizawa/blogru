class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    @teacher_evaluations = Teacher.find(params[:id]).teacher_evaluations

    @profit = (@teacher.plan.name.to_i * @teacher.orders.count.to_i) / 0.8
  end
end
