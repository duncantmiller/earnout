class Deal < ActiveRecord::Base

  belongs_to :org
  has_many :landing_pages

  validates :org_id, presence: true

end
