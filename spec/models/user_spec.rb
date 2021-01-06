require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規登録" do
    context "新規登録がうまくいく時" do
      it "nameとemail、passwordが存在すれば登録できること" do
        expect(@user).to be_valid  
      end
    end
     context "新規登録がうまくいかない時" do
      it "nameが空では登録できないこと" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank") 
      end
      it "nameが8文字以上だと登録できないこと" do
        @user.name = "namenamename"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 8 characters)") 
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it "passwordが英語だけでは登録できないこと" do
        @user.password = "namename"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers") 
      end
      it "passwordが数字だけでは登録できないこと" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers") 
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
end
