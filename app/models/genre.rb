class Genre < ApplicationRecord
  has_many :topics, dependent: :nullify
  validates :name, length: { in: 1..12 } 
end
