class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :move_string
      t.integer :score
      t.integer :solver_id, null: false
      t.integer :exercise_id, null: false
      
      t.timestamps
    end
  end
end
