class SplitNameIntoFirstAndLaster < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :first, :string, :null => false, :default => ""
    add_column :users, :last, :string, :null => false, :default => ""
  end
end
