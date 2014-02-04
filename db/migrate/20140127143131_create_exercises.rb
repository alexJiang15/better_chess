class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :fen_position
      t.integer :difficulty
      t.integer :score
      t.integer :author_id, :null => false

      t.timestamps
    end
  end
end
