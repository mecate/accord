class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :name
      t.text :reply

      t.timestamps null: false
    end
  end
end
