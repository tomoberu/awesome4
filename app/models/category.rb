class Category < ApplicationRecord
  has_many :category_users
  has_many :posts
  has_many :users, through: :category_users

  validates :name, presence: true, uniqueness: true
end
