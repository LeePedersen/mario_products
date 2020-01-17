class Review < ApplicationRecord
  belongs_to :product

  # dry code a bit here?
  validates :author, presence: true
  validates :rating, presence: true
  validates :content_body, presence: true

  before_save(:titleize_reviewer_name)

  private
    def titleize_reviewer_name
      self.author = self.author.titleize
    end
end
