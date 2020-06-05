require "rails_helper"


describe "the add a product reviews" do
  before(:each) do
    @product = Product.create(name:"Takuan", cost: 1, country_of_origin: "China")
  end

  it "adds a new review" do
    visit product_path(@product)
    click_on "Add a review to this product"
    expect(page).to have_content 'Add a new review for "Takuan"'
    fill_in 'Name', :with => 'Kiwi'
    fill_in 'Content body', :with => 'ads lijawd kljbasf ;iad;ouhascknasd oiha wioafp ojaF pijAWd ljnasd'
    fill_in 'Rate this product', :with => 4
    click_on "Create Review"
    expect(page).to have_content '4 star rating by Kiwi'
  end
  
  it "shows error messages" do
    visit product_path(@product)
    click_on "Add a review to this product"
    click_on "Create Review"
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Rating Please rate from 1 to 5"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body Contents must be between 50 and 250 characters"
  end

  
end
