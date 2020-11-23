require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事の保存' do
    context "ツイートが保存できる場合" do
      it "タイトルとテキストとカテゴリーがあれば記事は保存される" do
        expect(@article).to be_valid
      end
    end
    context "記事が保存できない場合" do
      it "コンテントがないとツイートは保存できない" do
        @article.content = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("Content can't be blank")
      end     
      it "タイトルがないとツイートは保存できない" do
        @article.title = ""
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end     
      it "カテゴリーIDが1以外でないとツイートは保存できない" do
        @article.category_id = "1"
        @article.valid?
        expect(@article.errors.full_messages).to include("Category must be other than 1")
      end     
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("User must exist")
      end
    end
  end
end
