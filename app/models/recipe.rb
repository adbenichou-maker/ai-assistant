class Recipe < ApplicationRecord
  belongs_to :user

  validates :title, :ingredients, :description, :steps, presence: true;
  validates :cooking_time, numericality: { only_integer: true };

end
