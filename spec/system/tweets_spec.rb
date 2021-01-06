require 'rails_helper'

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_title = Faker::Lorem.sentence
    @post_place = Faker::Lorem.sentence
    @post_content = Faker::Lorem.sentence
  end
  context '投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
       # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('new post')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'post_title', with: @post_title
      fill_in 'post_place', with: @post_place
      fill_in 'post_content', with: @post_content
      # 送信するとpostモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { post.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページには先ほど投稿した内容の投稿が存在することを確認する（テキスト）
      expect(page).to have_content(@post_title)
      expect(page).to have_content(@post_place)
      expect(page).to have_content(@post_content)
      end
    end
  context '投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('new post')
    end
  end
end
RSpec.describe '投稿編集', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context '投稿編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した投稿の編集ができる' do
      # 投稿1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @post1.user.email
      fill_in 'パスワード', with: @post1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 投稿1に「編集」ボタンがあることを確認する
      visit post_path(@post1)
      expect(page).to have_link '編集する', href: edit_post_path(@post1)
      # 編集ページへ遷移する
      visit edit_post_path(@post1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#post_title').value
      ).to eq @post1.title
      expect(
        find('#post_place').value
      ).to eq @post1.place
      expect(
        find('#post_content').value
      ).to eq @post1.content
      # 投稿内容を編集する
      fill_in 'post_title', with: "#{@post1.title}+編集したテキスト"
      fill_in 'post_place', with: "#{@post1.place}+編集したテキスト"
      fill_in 'post_content', with: "#{@post1.content}+編集したテキスト"
      # 編集してもpostモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(0)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # トップページには先ほど変更した内容の投稿が存在することを確認する（テキスト）
      expect(page).to have_content("#{@post1.title}+編集したテキスト")
      expect(page).to have_content("#{@post1.place}+編集したテキスト")
      expect(page).to have_content("#{@post1.content}+編集したテキスト")
    end
  end
  context '投稿編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した投稿の編集画面には遷移できない' do
      # 投稿1を投稿したユーザーでログインする
      # 投稿2に「編集」ボタンがないことを確認する
    end
    it 'ログインしていないと投稿の編集画面には遷移できない' do
      # トップページにいる
      # 投稿1に「編集」ボタンがないことを確認する
      # 投稿2に「編集」ボタンがないことを確認する
    end
  end
end