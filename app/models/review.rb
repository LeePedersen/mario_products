class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :rating, :numericality => true, :inclusion => {:in => 1..5, :message => "is not included in the list"}
  validates :content_body, presence: true
  validates_length_of :content_body, maximum: 250
  validates_length_of :content_body, minimum: 50
  before_save(:titleize_reviewer_name)

  # private
    def titleize_reviewer_name
      self.author = self.author.titleize
    end
end
