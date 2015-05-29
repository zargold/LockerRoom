class Goal < ActiveRecord::Base
	#set the Goal's name to automatically be the Exercise.id's save
  before_save :default_values
  
  belongs_to :user
  belongs_to :exercise
  has_many :workouts, dependent: :destroy
  
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :exercise_id, presence: true
  validates :weight, presence: true
  validates :reps, presence: true
  
  def default_values
    self.goal_name = self.exercise.name if self.goal_name.nil?
  end

end
