class Flavor < ApplicationRecord
  has_many :flavor_categories
  has_many :categories, through: :flavor_categories
  has_many :reviews
  has_many :bookmarks

  validates :body, length: { maximum: 255 }
  validates :sweet, presence: true
  validates :refresh, presence: true
  validates :relax, presence: true

  attr_accessor :flavor_element_option_1, :flavor_element_option_2
  accepts_nested_attributes_for :flavor_categories, allow_destroy: true
  
  class << self
    def sorting(flavor_arry, taste_status)
      flavors = Flavor.all
      flavors.each do |flavor|
        average_star = Review.where(flavor_id: flavor.id).average(:star).to_f
        Flavor.find(flavor.id).update(score: average_star)
      end
      if taste_status == 'alcohol'
        self.joins(:categories).where(id: flavor_arry).where(categories:{kind: "アルコールを含む"})
      elsif taste_status == 'other'
        self.where(id: flavor_arry)
      else
        self.where(id: flavor_arry).where(flavor_element_base: taste_status)
      end
    end

    def feeling(feeling_status)
      if feeling_status == 'refresh'
        self.where('refresh > ?', 7)
      elsif feeling_status == 'relax'
        self.where('relax > ?', 7)
      elsif feeling_status == 'sweet'
        self.where('sweet > ?', 7)
      elsif feeling_status == 'not_sweet'
        self.where('sweet < ?', 4)
      else
        self.where('refresh <= ?', 10)
      end
    end
  end
end
