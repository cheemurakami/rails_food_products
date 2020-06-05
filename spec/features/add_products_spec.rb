require 'rails_helper'

describe "the add a product process" do
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
end