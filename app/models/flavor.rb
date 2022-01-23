class Flavor < ApplicationRecord
  belongs_to :category
  has_many :reviews

  validates :category_id, presence: true
  validates :name, presence: true
  validates :body, length: { maximum: 255 }
end
