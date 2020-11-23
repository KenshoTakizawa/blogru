require 'rails_helper'

describe Notification do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'Like機能' do
    context 'Likeがうまくいくとき' do
      it "user_idとarticle_idが存在すればうまくLikeは機能する" do
        expect(@like).to be_valid
      end

    end

    context 'Likeがうまくいかないとき' do
      it "user_idが空では登録できない" do
        @like.user_id = ""
        @like.valid?
        expect(@like.errors.full_messages).to include("User must exist")
      end
      it "article_idが空では登録できない" do
        @like.article_id = ""
        @like.valid?
        expect(@like.errors.full_messages).to include("Article must exist")
      end
    end
  end
end