class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_flavors, through: :bookmarks, source: :flavor

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  def bookmark(flavor)
    bookmark_flavors << flavor
  end

  def unbookmark(flavor)
    bookmark_flavors.destroy(flavor)
  end

  def bookmark?(flavor)
    bookmark_flavors.include?(flavor)
  end

end
