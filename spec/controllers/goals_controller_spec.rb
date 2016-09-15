require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe 'goals#index' do
    it "successfully shows the index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'goals#new' do
    it "successfully shows the new goal form" do
      u = FactoryGirl.create(:user)
      sign_in u
      get :new, user_id: u.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'goals#create' do
    it "requires user to be logged in" do
      goal_count = Goal.count
      post :create, user_id: 1, goal: { title: "fail!" }
      expect(response).to redirect_to new_user_session_path
      expect(Goal.count).to eq goal_count
    end
    it "succesfully creates a new goal in the database" do
      u = FactoryGirl.create(:user)
      sign_in u
      post :create, user_id: u.id, goal: { title: "my goal" }
      expect(response).to redirect_to root_path
      goal = Goal.last
      expect(goal.title).to eq("my goal")
      expect(goal.user).to eq(u)
    end
  end
end
