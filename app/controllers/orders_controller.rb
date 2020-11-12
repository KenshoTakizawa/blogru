class OrdersController < ApplicationController
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

  def order_params
    params.require(:order).permit(:price).merge(user_id: current_user.id, teacher_id: @teacher.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a0ee0acb360002040aec8eb6"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    customer = Payjp::Customer.create(card: order_params[:token])
    Payjp::Subscription.create(customer:customer.id, plan: @teacher.plan.plann)
    
  end

  
end
