class RemoveLastLoggedInFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :last_logged_in
  end
end
