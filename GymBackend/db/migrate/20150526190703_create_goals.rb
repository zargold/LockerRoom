class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :exercise_id
      t.integer :reps
      t.float :weight
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
