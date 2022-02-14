class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :flavor

  validates :user_id, uniqueness: { scope: :flavor_id }
end