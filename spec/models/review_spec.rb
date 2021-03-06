require 'rails_helper'

describe Review do
  it { should belong_to :product }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_least(50).is_at_most(250) }
  it { should validate_inclusion_of(:rating).in_range(1..5)}

  it("titleizes the name of a reviewer") do
    product = Product.create({name: "giant steps", cost: 5.00, country_of_origin: "China"})
    product.save
    review = product.reviews.new({author: "me", rating: 3, content_body: "It was good I guess" })
    review.titleize_reviewer_name
    review.save
    expect(review.author()).to(eq("Me"))
  end
end
