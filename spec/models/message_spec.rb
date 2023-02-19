require 'rails_helper'
RSpec.describe Message, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room)
    @message = FactoryBot.build(:message, user_id: user.id, room_id: room.id)
  end

  describe 'メッセージ' do
    context 'メッセージが保存できるとき' do
      it 'messageがあると保存できる' do
         expect( @message).to be_valid
      end
    end
    context 'メッセージが保存できないとき' do
      it 'messageが空では保存できない' do
        @message.message = ' '
        @message.valid?
        expect( @message.errors.full_messages).to include "Message can't be blank"
      end
      it 'user_idが空では保存できない' do
        @message.user_id = nil
        @message.valid?
        expect(@message.errors[:user_id]).to include("can't be blank")
      end
      it 'room_idが空では保存できない' do
        @message.room_id = nil
        @message.valid?
        expect(@message.errors[:room_id]).to include("can't be blank")
      end
    end
  end
end