require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :content_body }
  it("titleizes the name of a reviewer") do
    review = Review.create({author: "me", rating: 3, content_body: "It was good I guess" })
    expect(review.author()).to(eq("Me"))
  end
end
