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
      get :new, {:user_id => u.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'goals#create' do
    it "requires user to be logged in"
    it "succesfully creates a new goal in the database"
  end
end
