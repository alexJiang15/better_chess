class RenameSolverIdToUserId < ActiveRecord::Migration
  def change
    rename_column :solutions, :solver_id, :user_id
  end
end
