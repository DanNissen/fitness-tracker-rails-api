class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.references :exercise, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date
      t.integer :sets
      t.integer :reps
      t.integer :rest_in_seconds
      t.string :tempo

      t.timestamps
    end
  end
end
