require 'rails_helper'
RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね機能' do
    context 'いいねできないとき' do
      it 'user_idが空ではいいねできない' do
        @like.user_id = nil
        @like.valid?
        expect(@like.errors[:user_id]).to include("can't be blank")
      end
      it 'post_idが空ではいいねできない' do
        @like.post_id = nil
        @like.valid?
        expect(@like.errors[:post_id]).to include("can't be blank")
      end
    end
  end
end