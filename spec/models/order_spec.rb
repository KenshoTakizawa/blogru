require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'orderの保存' do
    context "orderが保存できる場合" do
      it "userとteacherが紐付いればorderは保存される" do
        expect(@order).to be_valid
      end

    end
    context "orderが保存できない場合" do
      
      it "userが紐付いていないとorderは保存できない" do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User must exist")
      end     
      it "teacherが紐付いていないとorderは保存できない" do
        @order.teacher = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Teacher must exist")
      end
    end
  end
end