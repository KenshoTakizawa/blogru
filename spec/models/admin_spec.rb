require 'rails_helper'
describe Admin do
  before do
    @admin = FactoryBot.build(:admin)
  end

  describe 'admin新規登録' do
    context '新規登録がうまくいくとき' do
      it "email、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@admin).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @admin.password = "000000"
        @admin.password_confirmation = "000000"
        expect(@admin).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "emailが空では登録できない" do
        @admin.email = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @admin.save
        another_admin = FactoryBot.build(:admin)
        another_admin.email = @admin.email
        another_admin.valid?
        expect(another_admin.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @admin.password = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @admin.password = "12345"
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @admin.password_confirmation = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
