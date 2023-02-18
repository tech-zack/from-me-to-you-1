require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
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
    end
  end
end