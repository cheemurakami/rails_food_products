require 'rails_helper'


describe "the add a product process" do
  before(:each) do
    admin_user = User.create(email: "kiwi@example.com", password: "123456", admin: true)
    visit new_user_session_path
    fill_in "Email", :with => "kiwi@example.com"
    fill_in "Password", :with => "123456"
    click_on "Log in"    
  end

  it "adds a new product" do
    visit products_path
    click_link "Create new product"
    fill_in 'Name', :with => 'Takuan'
    fill_in 'Cost', :with => 1
    fill_in 'Country of origin', :with => 'China'
    click_on "Create Product"
    expect(page).to have_content 'Takuan'
  end

  it "gives an error when no name is entered" do
    visit products_path
    click_link "Create new product"
    click_on "Create Product"
    expect(page).to have_content "Name can't be blank"
  end
  it "gives an error when no cost is entered" do
    visit products_path
    click_link "Create new product"
    click_on "Create Product"
    expect(page).to have_content "Cost can't be blank"
  end
  it "gives an error when no country of origin is entered" do
    visit products_path
    click_link "Create new product"
    click_on "Create Product"
    expect(page).to have_content "Country of origin can't be blank"
  end
  it "deletes the product" do
    visit products_path
    click_link "Create new product"
    fill_in 'Name', :with => 'Takuan'
    fill_in 'Cost', :with => 1
    fill_in 'Country of origin', :with => 'China'
    click_on "Create Product"
    expect(page).to have_content 'Takuan'
    click_on "Takuan"
    click_link "Edit this product"
    fill_in 'Cost', :with => 2
    click_on "Update Product"
    expect(page).to have_content "Product updated!"
  end
end