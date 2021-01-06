require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe "新規投稿" do
    context "新規コメントがうまくいく時" do
      it "textが存在すれば登録できること" do
        expect(@comment).to be_valid  
      end
    end
     context "新規コメントがうまくいかない時" do
      it "textが空では登録できないこと" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank") 
      end
    end
  end
end
