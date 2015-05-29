class Workout < ActiveRecord::Base
  belongs_to :goal
  has_one :user, through: :goal
  has_many :exercises, through: :goal
  default_scope -> {order(created_at: :desc)}
  validates :goal_id, presence: true
  validates :weight, presence: true
  validates :reps, presence: true

end