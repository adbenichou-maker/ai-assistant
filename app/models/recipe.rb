class Recipe < ApplicationRecord
  belongs_to :message

  has_one :chat, through: :message
  has_one :user, through: :chat


  validates :title, :content, presence: true

end
