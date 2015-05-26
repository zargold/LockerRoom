class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
