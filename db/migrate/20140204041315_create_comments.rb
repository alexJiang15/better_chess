class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :commentable, polymorphic: true
      t.integer :author_id
      t.timestamps
    end
  end
end
