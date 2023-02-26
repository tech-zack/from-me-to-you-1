class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :message, presence: true
end
