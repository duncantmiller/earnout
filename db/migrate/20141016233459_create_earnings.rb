class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.integer :deal_id
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
