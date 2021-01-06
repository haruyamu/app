require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do
    @post = FactoryBot.create(:post)
  end
  describe "GET /posts" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのtitleが存在する" do 
      get root_path
      expect(response.body).to include @post.title
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのplaceが存在する" do 
      get root_path
      expect(response.body).to include @post.place
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのcontentが存在する" do 
      get root_path
      expect(response.body).to include @post.content
    end
  end
  # describe "show /posts" do
  #   it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
  #     get post_path(@post)
  #     expect(response.status).to eq 200
  #   end
  #   it "showアクションにリクエストするとレスポンスに投稿済みのツイートのtitleが存在する" do 
  #     get post_path(@post)
  #     expect(response.body).to include @post.title
  #   end
  #   it "showアクションにリクエストするとレスポンスに投稿済みのツイートのplaceが存在する" do 
  #     get post_path(@post)
  #     expect(response.body).to include @post.place
  #   end
  #   it "showアクションにリクエストするとレスポンスに投稿済みのツイートのcontentが存在する" do 
  #     get post_path(@post)
  #     expect(response.body).to include @post.content
  #   end
    # it "showアクションにリクエストするとレスポンスにこの投稿へのコメント表示部分が存在する" do 
    #   get post_path(@post)
    #   expect(response.body).to include "この投稿へのコメント"
    # end
  # end
end
