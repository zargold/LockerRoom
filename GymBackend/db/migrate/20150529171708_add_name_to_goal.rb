class AddNameToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :goal_name, :text
  end
end