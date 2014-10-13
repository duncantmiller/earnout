class LandingPage < ActiveRecord::Base

  belongs_to :deal

  validates :deal_id, presence: true
  validates :url, presence: true

end
