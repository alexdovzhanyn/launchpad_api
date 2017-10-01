require 'rails_helper'

RSpec.describe Listing, type: :model do
  it "returns comments attached to it" do
    u = User.create(first_name: 'Testy', last_name: 'McTestFace', email: 'test@mail.com', password: 'password')
    listing =  u.listings.create(title: 'Test Listing', description: 'This is a Test Listing', category: 'Test')

    commenter = User.create(first_name: 'Commenter', last_name: 'Person', email: 'commentor@mail.com', password: 'password')
    listing.comments.create(content: 'This is a test comment', user_id: commenter.id)

    json_listing = JSON.parse(listing.to_json)

    expect(json_listing['comments'].present? && json_listing['comments'].length > 0).to eq true
  end
end
