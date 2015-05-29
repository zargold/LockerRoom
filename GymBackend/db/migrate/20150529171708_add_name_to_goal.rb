class AddNameToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :gname, :text, default: goal.exercise.name
  end
end
