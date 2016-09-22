class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @plans = Plan.todays.where(user_id: current_user.id)
    @plan = Plan.new
  end
end
