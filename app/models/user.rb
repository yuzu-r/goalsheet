class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :plans
  has_many :goals
  def unplanned_goals
    # this is all the user goals that are not in any plans for today
    goals.where.not(id: plans.todays.pluck(:goal_id))
  end
end
