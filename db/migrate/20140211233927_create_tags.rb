class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag, null: false
      t.integer :votes, default: 0
      t.references :taggable, polymorphic: true
      t.timestamps
    end
  end
end
