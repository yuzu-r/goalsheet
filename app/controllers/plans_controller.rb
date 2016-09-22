class PlansController < ApplicationController
  def create
    goal = Goal.find(params[:goal_id])
    @plan = Plan.create(goal_id: goal.id, user: current_user)
    if @plan.valid?
      redirect_to dashboard_path
    else
      render text: 'fail!', status: :unprocessable_entity
    end
  end

  def edit
  end

  def mark_complete
    @plan = Plan.find(params[:id])
    if @plan.valid?
      if @plan.is_complete
        @plan.update_attributes(is_complete: false)
      else
        @plan.update_attributes(is_complete: true)
      end
    else
      render text: 'plan not found!', status: :unprocessable_entity
    end

    if request.xhr?
      render :json => {:success => "success", :status_code => 200}
    else
      redirect_to dashboard_path
    end
  end

  private
    def plan_params()
      params.require(:plan).permit(:goal_id)
    end

end
