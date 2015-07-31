class CreateRelationpolls < ActiveRecord::Migration
  def change
    create_table :relationpolls do |t|
      t.text :user
      t.text :donator

      t.timestamps null: false
    end
  end
end
