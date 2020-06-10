require 'rails_helper'

describe Product do
  before do
    @products = FactoryBot.create_list(:product, 10)
  end
  it { should have_many(:reviews) }
  it { should validate_presence_of :name}
  it { should validate_presence_of :cost}
  it { should validate_presence_of :country_of_origin}

  it("titleizes the name of a product") do
    product = Product.create({name: "nico burger", cost: 2, country_of_origin: "japan"})
    expect(product.name()).to(eq("Nico Burger"))
    expect(product.country_of_origin()).to(eq("Japan"))
  end
end