class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :reps
      t.float :weight
      t.integer :goal_id

      t.timestamps null: false
    end
  end
end
