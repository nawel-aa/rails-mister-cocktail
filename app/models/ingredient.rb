class Ingredient < ApplicationRecord
  has_many :doses
  validates_associated :doses
  has_many :cocktails, through: :doses

  validates :name, presence: true, uniqueness: true
end
