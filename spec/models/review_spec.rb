require 'rails_helper'

describe Review do

  it { should belong_to(:product) }
  it { should validate_presence_of :author}
  it { should validate_presence_of :content_body}
  it { should validate_length_of(:content_body).
    is_at_least(50).
    is_at_most(250).
    with_message("Contents must be between 50 and 250 characters")}
  it { should validate_presence_of :rating}
  it { should validate_numericality_of(:rating).
    is_greater_than(0).
    is_less_than(6).
    with_message("Please rate from 1 to 5")}
    
  end