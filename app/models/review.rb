class Review < ApplicationRecord
  
  belongs_to :product

  validates :author, presence: true

  validates :rating, presence: true
  
  validates_numericality_of :rating, greater_than: 0, less_than: 6, message: "Please rate from 1 to 5"

  validates :content_body,  presence: true, length: {in: 50..250, message: "Contents must be between 50 and 250 characters"}
 
end

