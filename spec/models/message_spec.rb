require 'rails_helper'
RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
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
    end
  end
end