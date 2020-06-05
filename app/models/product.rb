class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  has_one_attached :product_photo

  before_save(:titleize_product)

  scope :three_most_recent, -> {order(created_at: :desc).limit(3)}

  scope :three_most_reviews, -> {select("products.*, count(reviews.id) as most_review").joins(:reviews).group("products.id").order("most_review DESC").limit(3)}

  scope :made_in_usa, -> {where(country_of_origin: "United States Of America")}

  private
  def titleize_product
    self.name = self.name.titleize
    self.country_of_origin = self.country_of_origin.titleize
  end
end