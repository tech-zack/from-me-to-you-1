class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,presence: true
  validates :image,presence: true
  validates :profile, length: { maximum: 200 }
  has_many :posts, dependent: :destroy 
  has_many :comments, dependent: :destroy
end

