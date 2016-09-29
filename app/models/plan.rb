class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal

  scope :todays, -> { where("created_at >= ?", Time.zone.now.beginning_of_day).order(id: :asc) }

 end
