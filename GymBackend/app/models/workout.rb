class Workout < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user, through: :goal
  default_scope -> {order(created_at: :desc)}
  validates :goal_id, presence: true
  validates :weight, presence: true
  validates :reps, presence: true

end