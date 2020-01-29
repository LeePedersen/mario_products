require 'spec_helper'

describe 'the user sign up path', {:type => :feature} do
  it 'takes the user to the homepage where they can sign up' do
    visit '/'
    click_link('Sign up')
    expect(page).to have_content("Sign up")
  end
  it 'actually signs the user up' do
    visit '/users/new'
    fill_in('user_email', with: "example@email.com")
    fill_in('user_password', :with => "password")
    fill_in('user_password_confirmation', :with => "password")
    click_button('commit')
    expect(page).to have_content("You've successfully signed up!")
  end
end

describe 'the product path', {:type => :feature} do
  it 'allows a user to view a product' do
    test_product = Product.new({:name => 'Lee', :cost => 5.00, :country_of_origin => "US"})
    test_product.save
    visit '/'
    first('li').click_link('Lee')
    expect(page).to have_content('Made in US')
  end
  # it 'allows a user to review a product' do
  #   visit '/signin'
  #   fill_in('email', with: "admin")
  #   fill_in('password', :with => "admin")
  #   click_button('commit')
  #   expect(page).to have_content("You've signed in.")
    # first('li').click_link('Lee')
    # click_link('Add Review')
    # fill_in('review_author', with: "Lee")
    # fill_in('review_rating', with: "4")
    # fill_in('review_content_body', with: "It was excellent and I need more than 50 characters is this 50 I hope this is 50")
    # click_button('commit')
    # expect(page).to have_content('Review saved!')
  # end
end
