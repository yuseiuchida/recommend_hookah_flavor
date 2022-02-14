class Category < ApplicationRecord
  has_many :flavor_categories
  has_many :flavors, through: :flavor_categories

  validates :kind, presence: true
end
