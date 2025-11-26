class Shop < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
