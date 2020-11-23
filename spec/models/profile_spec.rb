require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィールの保存' do
    context "プロフィールが保存できる場合" do
      it "画像とnicknameとlearning_historyとpurposeとbirth_dateがあればプロフィールは保存される" do
        expect(@profile).to be_valid
      end
      it "画像がなくてもプロフィールは保存される" do
        @profile.image = nil
        @profile.valid?
        expect(@profile).to be_valid
      end
      it "birth_dateがなくてもプロフィールは保存される" do
        @profile.birth_date = ""
        @profile.valid?
        expect(@profile).to be_valid
      end     
    end
    context "プロフィールが保存できない場合" do
      it "nicknameがないとプロフィールは保存できない" do
        @profile.nickname = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Nickname can't be blank")
      end     
      it "learning_historyがないとプロフィールは保存できない" do
        @profile.learning_history = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Learning history can't be blank")
      end     
      it "purposeがないとプロフィールは保存できない" do
        @profile.purpose = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Purpose can't be blank")
      end     
      
      it "ユーザーが紐付いていないとプロフィールは保存できない" do
        @profile.user = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("User must exist")
      end
    end
  end
end
