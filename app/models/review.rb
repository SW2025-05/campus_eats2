class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shop

  validates :content, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
