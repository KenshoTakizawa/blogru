require 'rails_helper'

describe Notification do
  before do
    @notification = FactoryBot.build(:notification)
    @user1 = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
    @article = FactoryBot.build(:article)
    @notification.visiter_id = @user1.id
    @notification.visited_id = @user2.id
    @notification.article_id = @article.id
  end

  describe '通知機能' do
    context '通知がうまくいくとき' do
      it "visiter_idとvisited_idとarticle_idとcomment_idとactionが存在すれば登録できる" do
        expect(@notification).to be_valid
      end

    end

    context '通知がうまくいかないとき' do
      it "visiter_idが空では登録できない" do
        @notification.visiter_id = ""
        @notification.valid?
        expect(@notification.errors.full_messages).to include("Visiter can't be blank")
      end
      it "visited_idが空では登録できない" do
        @notification.visited_id = ""
        @notification.valid?
        expect(@notification.errors.full_messages).to include("Visited can't be blank")
      end
      it "article_idが空では登録できない" do
        @notification.article_id = ""
        @notification.valid?
        expect(@notification.errors.full_messages).to include("Article can't be blank")
      end
      it "comment_idが空では登録できない" do
        @notification.comment_id = ""
        @notification.valid?
        expect(@notification.errors.full_messages).to include("Comment can't be blank")
      end
      it "actionが空では登録できない" do
        @notification.action = ""
        @notification.valid?
        expect(@notification.errors.full_messages).to include("Action can't be blank")
      end
    end
  end
end