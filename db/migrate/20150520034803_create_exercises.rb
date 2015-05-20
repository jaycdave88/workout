class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.references :workout, index: true
      t.belongs_to :user

      t.timestamps
    end
  end
end
