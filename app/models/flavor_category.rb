class FlavorCategory < ApplicationRecord
  belongs_to :flavor, optional: true
  belongs_to :category, optional: true
end
