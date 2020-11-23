require 'rails_helper'

describe Teacher do
  before do
    @teacher = FactoryBot.build(:teacher)
  end

  describe 'teacher新規登録' do
    context '新規登録がうまくいくとき' do
      it "teach_contentとteach_detailとteacher_historyとnicknameとemailとplan_idとpasswordとpassword_confirmationが存在すれば登録できる" do
        expect(@teacher).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @teacher.password = "000000"
        @teacher.password_confirmation = "000000"
        expect(@teacher).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "teach_contentが空では登録できない" do
        @teacher.teach_content = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Teach content can't be blank")

      end
      it "teach_detailが空では登録できない" do
        @teacher.teach_detail = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Teach detail can't be blank")
      end
      it "teacher_historyが空では登録できない" do
        @teacher.teacher_history = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Teacher history can't be blank")
      end
      it "nicknameが空では登録できない" do
        @teacher.nickname = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Nickname can't be blank")
      end
      it "plan_idが1以外でないと登録できない" do
        @teacher.plan_id = "1"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Plan must be other than 1")
      end

      it "emailが空では登録できない" do
        @teacher.email = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @teacher.save
        another_teacher = FactoryBot.build(:teacher)
        another_teacher.email = @teacher.email
        another_teacher.valid?
        expect(another_teacher.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @teacher.password = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @teacher.password = "12345"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @teacher.password_confirmation = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
