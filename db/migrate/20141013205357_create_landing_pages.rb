class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|
      t.integer :deal_id
      t.text :url

      t.timestamps
    end
  end
end
