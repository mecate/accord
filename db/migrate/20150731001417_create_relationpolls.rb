class CreateRelationpolls < ActiveRecord::Migration
  def change
    create_table :relationpolls do |t|
      t.text :user
      t.text :donator
      t.boolean :used, :default => false

      t.timestamps null: false
    end
  end
end
