class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flavor

  validates :star, presence: true
  validates :comment, length: { maximum: 150 }
end
