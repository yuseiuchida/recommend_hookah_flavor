class Category < ApplicationRecord
  has_many :flavors

  validates :name, presence: true
  validates :kind, presence: true
  validates :fruit, presence: true
  validates :sweet, presence: true
  validates :refresh, presence: true
  validates :alcohol, presence: true

end
