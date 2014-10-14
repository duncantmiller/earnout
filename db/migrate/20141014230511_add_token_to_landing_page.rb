class AddTokenToLandingPage < ActiveRecord::Migration
  def change
    add_column :landing_pages, :token, :string
  end
end
