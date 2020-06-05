require "rails_helper"


describe "the add a product reviews" do
  before(:each) do
    admin_user = User.create(email: "kiwi@example.com", password: "123456", admin: true)
    visit new_user_session_path
    fill_in "Email", :with => "kiwi@example.com"
    fill_in "Password", :with => "123456"
    click_on "Log in"    
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

  it "edits, updates, and destroys a review" do
    visit product_path(@product)
    click_on "Add a review to this product"
    fill_in 'Name', :with => 'Kiwi'
    fill_in 'Content body', :with => 'adlkaw ljkawe lknasd ljawd ,nasd lojaw ;piawds;l japojwd kjdc sdasd sdoih'
    fill_in 'Rate this product', :with => 4
    click_on "Create Review"
    expect(page).to have_content "New review added!"
    click_on "4 star rating by Kiwi"
    click_on "Edit review"
    fill_in 'Rating', :with => 5
    click_on "Update Review"
    expect(page).to have_content "Review updated!"
    click_on "Delete"
    expect(page).to have_content "Current products"
  end

  it "deletes a review" do
    visit product_path(@product)
    click_on "Add a review to this product"
    fill_in 'Name', :with => 'Kiwi'
    fill_in 'Content body', :with => 'adlkaw ljkawe lknasd ljawd ,nasd lojaw ;piawds;l japojwd kjdc sdasd sdoih'
    fill_in 'Rate this product', :with => 4
    click_on "Create Review"
    expect(page).to have_content "New review added!"

  end

  
end
