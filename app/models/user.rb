class User < ApplicationRecord
  has_many :chats
  has_many :recipes
  has_many :messages, through: :recipes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

end
