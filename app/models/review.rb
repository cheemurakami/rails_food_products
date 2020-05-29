class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :rating, presence: true
  validates :content_body, length: {in: 50..250, message: "Contents must be between 50 and 250 characters"}, presence: true
 
end

