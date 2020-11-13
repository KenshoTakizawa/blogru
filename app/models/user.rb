class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :orders
  has_many :teacher_evaluations, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
   has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # def making_customer(email)
  #   if customer_id==nil
  #   Payjp.api_key = 'sk_test_a0ee0acb360002040aec8eb6'
  #   customer=Payjp::Customer.create(
  #       email:email,
  #       description: 'test',
  #       card: params["token"]
  #   )
  #   update(customer_id:customer.id)
  #   else
  #     customer_id_check
  #   end
  # end

  # def customer_id_check
  #   begin
  #   Payjp.api_key = 'sk_test_a0ee0acb360002040aec8eb6'
  #   check = Payjp::Customer.retrieve("#{customer_id}")
  #   rescue Payjp::InvalidRequestError=> e
  #     update(customer_id:nil)
  #   end
  # end

  # def subscription(current_user)
  #   Payjp.api_key = 'sk_test_a0ee0acb360002040aec8eb6'
  #   Payjp::Subscription.create(
  #       plan: 'kensho1',
  #       customer: "#{current_user.customer_id}"
  #   )
  # end
end
