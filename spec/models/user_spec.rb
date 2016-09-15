require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user_count = User.count
    u = FactoryGirl.create(:user)
    expect(u).to be_valid
    expect(User.count).to eq user_count + 1
  end
end
