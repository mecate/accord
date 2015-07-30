class AddColumnFacebookPool < ActiveRecord::Migration
  def up
    add_column :polls, :id_facebook, :text
    add_column :polls, :id_facebook_donation, :text
  end    
    def down
    remove_column :polls, :id_facebook, :integer
  end 
end
