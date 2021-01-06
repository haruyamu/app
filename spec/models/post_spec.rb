require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe "新規投稿" do
    context "新規投稿がうまくいく時" do
      it "title,content,place,imageが存在すれば登録できること" do
        expect(@post).to be_valid  
      end
    end
     context "新規投稿がうまくいかない時" do
      it "titleが空では登録できないこと" do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank") 
      end
      it "placeが空では登録できないこと" do
        @post.place = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Place can't be blank") 
      end

      it "contentが空では登録できないこと" do
        @post.content = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank") 
      end
      it "imageが空では登録できないこと" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank") 
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
