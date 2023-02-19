require 'rails_helper'
RSpec.describe Like, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'お気に入り機能' do
    context 'お気に入りできないとき' do
      it 'user_idが空ではお気に入りできない' do
        @favorite.user_id = nil
        @favorite.valid?
        expect(@favorite.errors[:user_id]).to include("can't be blank")
      end
      it 'post_idが空ではお気に入りできない' do
        @favorite.post_id = nil
        @favorite.valid?
        expect(@favorite.errors[:post_id]).to include("can't be blank")
      end
    end
  end
end