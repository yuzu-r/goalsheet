class GoalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :edit, :update, :destroy]
  def index
    @goals = Goal.where(user: current_user)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.create(goal_params)
    if @goal.valid?
      redirect_to user_goals_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    current_goal.update_attributes(goal_params)
    if current_goal.valid?
      redirect_to user_goals_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_goal.user_id != current_user.id
      return render text: "Not Allowed!", status: :forbidden
    end
    current_goal.destroy
    redirect_to user_goals_path(current_user)
  end

  private
    def current_goal
      @goal || Goal.find(params[:id])
    end

    def goal_params()
      params.require(:goal).permit(:title, :description, :frequency, :session_length)
    end
end
