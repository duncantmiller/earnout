class Earning < ActiveRecord::Base
  belongs_to :deal

  validates :deal, presence: true
  validates :amount, presence: true

  def has_matching_cookie?(hidden_ids = nil)
    if hidden_ids.present? && hidden_ids.include?(deal.id)
      true
    else
      false
    end
  end
end
