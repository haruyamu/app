require 'rails_helper'

# RSpec.describe '投稿', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @post_title = Faker::Lorem.sentence
#     @post_place = Faker::Lorem.sentence
#     @post_content = Faker::Lorem.sentence
#   end
#   context '投稿ができるとき'do
#     it 'ログインしたユーザーは新規投稿できる' do
#        # ログインする
#        sign_in(@user)
#       # 新規投稿ページへのリンクがあることを確認する
#       expect(page).to have_content('new post')
#       # 投稿ページに移動する
#       visit new_post_path
#       # フォームに情報を入力する
#       fill_in 'post_title', with: @post_title
#       fill_in 'post_place', with: @post_place
#       fill_in 'post_content', with: @post_content
#       # トップページに遷移する
#       expect(current_path).to eq root_path
#       # トップページには先ほど投稿した内容の投稿が存在することを確認する（テキスト）
#       expect(page).to have_content(@post_title)
#       expect(page).to have_content(@post_place)
#       expect(page).to have_content(@post_content)
#       end
#     end
#   context '投稿ができないとき'do
#     it 'ログインしていないと新規投稿ページに遷移できない' do
#       # トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがない
#       expect(page).to have_no_content('new post')
#     end
#   end
# end
# RSpec.describe '編集', type: :system do
#   before do
#     @post1 = FactoryBot.create(:post)
#     @post2 = FactoryBot.create(:post)
#   end
#   context '編集ができるとき' do
#     it 'ログインしたユーザーは自分の投稿の編集ができる' do
#       # 投稿1を投稿したユーザーでログインする
#       sign_in(@post1.user)
#       # 投稿1に「編集」ボタンがあることを確認する
#       visit post_path(@post1)
#       expect(page).to have_link '編集する', href: edit_post_path(@post1)
#       # 編集ページへ遷移する
#       visit edit_post_path(@post1)
#       # すでに投稿済みの内容がフォームに入っていることを確認する
#       expect(
#         find('#post_title').value
#       ).to eq @post1.title
#       expect(
#         find('#post_place').value
#       ).to eq @post1.place
#       expect(
#         find('#post_content').value
#       ).to eq @post1.content
#       # 投稿内容を編集する
#       fill_in 'post_title', with: "#{@post1.title}+編集したテキスト"
#       fill_in 'post_place', with: "#{@post1.place}+編集したテキスト"
#       fill_in 'post_content', with: "#{@post1.content}+編集したテキスト"
#       # 編集してもpostモデルのカウントは変わらないことを確認する
#        expect{
#         find('input.offset-1').click
#       }.to change { Post.count }.by(0)
#       # トップページに遷移する
#       expect(current_path).to eq root_path
#       # トップページには先ほど変更した内容の投稿が存在することを確認する
#       expect(page).to have_content("#{@post1.title}+編集したテキスト")
#       expect(page).to have_content("#{@post1.place}+編集したテキスト")
#       expect(page).to have_content("#{@post1.content}+編集したテキスト")
#       end
#     end
#   end
# RSpec.describe '投稿削除', type: :system do
#   before do
#     @post1 = FactoryBot.create(:post)
#     @post2 = FactoryBot.create(:post)
#   end
#   context 'ツイート削除ができるとき' do
#     it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
#      # 投稿1を投稿したユーザーでログインする
#      sign_in(@post1.user)
#       # 投稿1に「削除」ボタンがあることを確認する
#       visit post_path(@post1)
#       expect(page).to have_link '削除する', href: post_path(@post1)
#       # 投稿を削除するとレコードの数が1減ることを確認する
#        expect{
#           find('a.destroy').click
#        }.to change { Post.count }.by(-1)
#       # トップページに遷移する
#       expect(current_path).to eq root_path
#     end
#   end
# end
  # context '投稿削除ができないとき' do
  #   it 'ログインしたユーザーは自分以外が投稿した投稿の削除ができない' do
  #     # 投稿1を投稿したユーザーでログインする
  #      sign_in(@post1.user)
  #     # 投稿2に「削除」ボタンが無いことを確認する
  #     expect(page).to have_no_link '削除する', href: post_path(@post2)
  #   end
  #   it 'ログインしていないと投稿の削除ボタンがない' do
  #     # トップページに移動する
  #       visit root_path
  #     # 投稿1に「削除」ボタンが無いことを確認する
  #     expect(page).to have_no_link '削除する', href: post_path(@post1)
  #     # 投稿2に「削除」ボタンが無いことを確認する
  #     expect(page).to have_no_link '削除する', href: post_path(@post2)
  #   end
  # end
# end

# RSpec.describe '詳細', type: :system do
#   before do
#     @post = FactoryBot.create(:post)
#   end
  # it 'ログインしたユーザーは詳細ページに遷移してコメント投稿欄が表示される' do
  #   # ログインする
  #     sign_in(@post.user)
  #   # 投稿にjump to pageボタンがあることを確認する
  #     expect(page).to  have_link 'jump to page',href: post_path(@post)
  #   # 詳細ページに遷移する
  #     visit post_path(@post)
  #   # 詳細ページに投稿の内容が含まれている
  #      expect(page).to have_content(@post_title)
  #      expect(page).to have_content(@post_place)
  #      expect(page).to have_content(@post_content)
  #   # コメント用のフォームが存在する
  #      expect(page).to have_selector 'form'
  # end
#   it 'ログインしていない状態で詳細ページに遷移できるもののコメント投稿欄が表示されない' do
#     # トップページに移動する
#     visit root_path
#     # 投稿にjump to pageボタンがあることを確認する
#       expect(page).to  have_link 'jump to page',href: post_path(@post)
#     # 詳細ページに遷移する
#     visit post_path(@post)
#     # 詳細ページに投稿の内容が含まれている
#        expect(page).to have_content(@post_title)
#        expect(page).to have_content(@post_place)
#        expect(page).to have_content(@post_content)
#     # フォームが存在しないことを確認する
#     expect(page).to have_no_content 'SEND'
#   end
# end
