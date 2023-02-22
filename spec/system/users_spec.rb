require 'rails_helper'
RSpec.describe User, type: :system do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.1
  end
  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      attach_file ( Rails.root + 'public/cafe201261763.jpg')
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      #新規登録を実施する
      click_on("新規登録")
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに、新規登録ページへ戻ってくる' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      attach_file = nil
      fill_in 'nickname', with: ''
      fill_in 'email', with: ''
      fill_in 'password', with: ''
      fill_in 'user[password_confirmation]', with: ''
      #モデルのカウントが変化しない
      expect{find('input[name = "commit"]').click}.to change{User.count}.by(0)
      #新規登録ページへ戻されることを確認する
      expect(current_path).to eq('/users/sign_up')
    end
  end 
end
