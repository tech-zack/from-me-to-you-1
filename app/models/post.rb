class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image
  has_many :comments, dependent: :destroy

  validates :image, presence: true 
  validates :title, presence: true, unless: :was_attached?
  validates :text, presence: true, unless: :was_attached?
  validates :category_id, presence: true, unless: :was_attached?
  validates :category_id, numericality: { other_than: 1 } 
  
  def was_attached?
    self.image.attached?
  end
end


