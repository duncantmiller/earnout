class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :org_id
      t.string :name
      t.text :description
      t.text :default_url
      t.string :status
      t.datetime :expires_on
      t.integer :commission
      t.string :commission_type

      t.timestamps
    end
  end
end
