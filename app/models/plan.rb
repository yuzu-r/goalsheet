class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :goals

  scope :todays, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  #def self.todays
  #  self.find()
  #end
end
