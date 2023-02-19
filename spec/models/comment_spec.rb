require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment, user_id: user.id, post_id: post.id)
  end

  describe 'コメント' do
    context 'コメントが保存できるとき' do
      it 'commentがあると保存できる' do
         expect( @comment).to be_valid
      end
    end
    context 'コメントが保存できないとき' do
      it 'commentが空では保存できない' do
        @comment.comment = ' '
        @comment.valid?
        expect( @comment.errors.full_messages).to include "Comment can't be blank"
      end
      it 'user_idが空ではコメントできない' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors[:user_id]).to include("can't be blank")
      end
      it 'post_idが空ではコメントできない' do
        @comment.post_id = nil
        @comment.valid?
        expect(@comment.errors[:post_id]).to include("can't be blank")
      end
    end
  end
end