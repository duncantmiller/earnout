class LandingPage < ActiveRecord::Base

  belongs_to :deal

  validates :deal_id, presence: true
  validates :url, presence: true

  before_create :generate_token

  def tracking_url
    "http://cloud4up.com/t/#{ token }"
  end

  private

  def generate_token
    until self.token && !LandingPage.exists?(token: self.token) do
      self.token = SecureRandom.urlsafe_base64(6, false)
    end
  end

end
