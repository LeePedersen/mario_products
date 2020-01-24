Product.destroy_all
Review.destroy_all

# seed database with images if time

50.times do |index|
  new_product = Product.create!(name: Faker::Space.star, cost: Faker::Number.number(digits: 2), country_of_origin: Faker::Space.planet)
  5.times do |index|
    new_review = new_product.reviews.new(author: Faker::Name.name, rating: Faker::Number.between(from: 1, to: 5), content_body: Faker::Lorem.sentence(word_count: 13))
    new_review.save
  end
end
p "Created #{Product.count} projects and #{Review.count} reviews"
