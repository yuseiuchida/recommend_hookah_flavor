class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flavor

  validates :user_id, presence: true
  validates :flavor_id, presence: true
  validates :star, presence: true
  validates :comment, presence: true, length: { maximum: 255 }
end
