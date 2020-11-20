class OrdersController < ApplicationController
  before_action :no_teacher
  before_action :do_login
  before_action :forbid_order
  require 'payjp'

  def index
    @order = Order.new
    @teacher = Teacher.find(params[:teacher_id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
    @orders = current_user.orders
  end

  private

  def no_teacher
    if current_teacher
      redirect_to root_path
    end
  end

  def do_login
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def forbid_order
    @teacher = Teacher.find(params[:teacher_id])
    if current_user.orders.find_by(teacher_id: @teacher.id)
      redirect_to root_path
    end
  end


  def order_params
    params.require(:order).permit(:price).merge(user_id: current_user.id, teacher_id: @teacher.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a0ee0acb360002040aec8eb6"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    customer = Payjp::Customer.create(card: order_params[:token])
    Payjp::Subscription.create(customer:customer.id, plan: @teacher.plan.plann)
    
  end

  
end
