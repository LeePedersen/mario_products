class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # dry code a bit here?
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :venus, -> { where(country_of_origin: "Venus") }

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}


  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}

  before_save(:titleize_product_name)

  private
    def titleize_product_name
      self.name = self.name.titleize
    end

end
