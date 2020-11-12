class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  validates_associated :doses
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
end
