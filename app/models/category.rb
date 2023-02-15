class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '思い出' },
    { id: 3, name: '風景' },
    { id: 4, name: '宝物' },
    { id: 5, name: '言葉' },
    { id: 6, name: '雑学' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end