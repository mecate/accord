class AddColumnsToUser < ActiveRecord::Migration
def up
    add_column :users, :votes, :integer, :default => 1
    add_column :users, :active_votes, :integer, :default => 1
  end

  def down
    remove_column :users, :votes, :integer
    remove_column :users, :active_votes, :integer
  end
end
