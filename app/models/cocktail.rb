class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates_associated :doses
  validates :name, presence: true, uniqueness: true
end
