class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # dry code a bit here?
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product_name)

  private
    def titleize_product_name
      self.name = self.name.titleize
    end

end
