class User < ApplicationRecord
  has_many :chats
  has_many :messages, through: :chats
  has_many :recipes, through: :messages

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

end
