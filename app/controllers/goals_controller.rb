class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  def index
    @goals = Goal.where(user: current_user)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.create(goal_params)
    if @goal.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def goal_params()
      params.require(:goal).permit(:title, :description, :frequency, :session_length)
    end
end
