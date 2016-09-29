class Goal < ActiveRecord::Base
  has_many :plans, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :user_id, presence: true
end
