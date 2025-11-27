class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :message

  has_one :user, through: :message

  validates :title, :content, presence: true;

end
