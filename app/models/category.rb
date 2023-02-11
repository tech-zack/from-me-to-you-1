class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '思いで' },
    { id: 3, name: '風景' },
    { id: 4, name: '宝物' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end