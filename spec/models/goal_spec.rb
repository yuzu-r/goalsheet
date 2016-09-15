require 'rails_helper'

RSpec.describe Goal, type: :model do
  it "has a valid factory" do
    goal_count = Goal.count
    g = FactoryGirl.create(:goal)
    expect(g).to be_valid
    expect(Goal.count).to eq goal_count+1
  end
  it "must have a valid user to be valid" do
    g = FactoryGirl.build(:goal, user: nil)
    expect(g).to_not be_valid
  end
  
end
