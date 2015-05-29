class Goal < ActiveRecord::Base
	belongs_to :exercise
	belongs_to :user
  has_many :workouts, dependent: :destroy
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :exercise_id, presence: true
  validates :weight, presence: true
  validates :reps, presence: true
end
