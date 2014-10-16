class Deal < ActiveRecord::Base

  belongs_to :org
  has_many :landing_pages
  has_many :earnings

  validates :org_id, presence: true

end
