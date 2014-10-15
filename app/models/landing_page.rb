class LandingPage < ActiveRecord::Base
  require 'uri'
  belongs_to :deal

  validates :deal_id, presence: true
  validates :url, presence: true

  before_create :generate_token

  def url_host
    parsed_url.host.match(/[^\.]+\.\w+$/).to_s.split(".")[-2,2].first
  end

  def parsed_url
    URI.parse(url)
  end

  def url_path
    parsed_url.path
  end

  def tracking_url
    "http://#{ url_host }.cloud4up.com/t/#{ token }#{url_path}"
  end

  private

  def generate_token
    until self.token && !LandingPage.exists?(token: self.token) do
      self.token = SecureRandom.urlsafe_base64(6, false)
    end
  end

end
