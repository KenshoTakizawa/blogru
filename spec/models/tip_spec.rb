require 'rails_helper'

RSpec.describe Tip, type: :model do
  before do
    @tip = FactoryBot.build(:tip)
  end

  describe 'tipの保存' do
    context "ツイートが保存できる場合" do
      it "タイトルとテキストと画像があれば記事は保存される" do
        expect(@tip).to be_valid
      end
      it "画像がなくても保存される" do
        @tip.image = ""
        expect(@tip).to be_valid
      end

    end
    context "記事が保存できない場合" do
      it "コンテントがないとツイートは保存できない" do
        @tip.content = ""
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Content can't be blank")
      end     
      it "タイトルがないとツイートは保存できない" do
        @tip.title = ""
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Title can't be blank")
      end         
      it "adminが紐付いていないとツイートは保存できない" do
        @tip.admin = nil
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Admin must exist")
      end
    end
  end
end