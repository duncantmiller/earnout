class AddPermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :org_id
      t.string :level

      t.timestamps
    end
  end
end
