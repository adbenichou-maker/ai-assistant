class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :title, :content, presence: true;

end
