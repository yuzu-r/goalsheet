class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @daily_plan = Plan.todays.find_or_initialize_by(user_id: current_user.id)
  end
end
