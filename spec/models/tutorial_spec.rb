require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  before do
    @tutorial = FactoryBot.build(:tutorial)
  end

  describe 'tutorialの保存' do
    context "ツイートが保存できる場合" do
      it "タイトルとテキストとカテゴリーと画像があれば記事は保存される" do
        expect(@tutorial).to be_valid
      end
      it "画像がなくても保存される" do
        @tutorial.image = ""
        expect(@tutorial).to be_valid
      end

    end
    context "記事が保存できない場合" do
      it "コンテントがないとツイートは保存できない" do
        @tutorial.content = ""
        @tutorial.valid?
        expect(@tutorial.errors.full_messages).to include("Content can't be blank")
      end     
      it "タイトルがないとツイートは保存できない" do
        @tutorial.title = ""
        @tutorial.valid?
        expect(@tutorial.errors.full_messages).to include("Title can't be blank")
      end     
      it "カテゴリーIDが1以外でないとツイートは保存できない" do
        @tutorial.tuto_category_id = "1"
        @tutorial.valid?
        expect(@tutorial.errors.full_messages).to include("Tuto category must be other than 1")
      end     
      it "adminが紐付いていないとツイートは保存できない" do
        @tutorial.admin = nil
        @tutorial.valid?
        expect(@tutorial.errors.full_messages).to include("Admin must exist")
      end
    end
  end
end
