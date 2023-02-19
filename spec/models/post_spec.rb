require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿' do
    context '投稿ができるとき' do
      it 'text,title,category_id,imageがあると登録できる' do
         expect(@post).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'titleが空では登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include "Title can't be blank"
      end
      it 'textが空では登録できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include "Text can't be blank"
      end
      it 'imageが空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "Image can't be blank"
      end
      it 'category_idが空では保存できないこと' do
        @post.category_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idが1では保存できないこと' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end