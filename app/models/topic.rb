class Topic < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates :name, length: { in: 1..20 } 
end
