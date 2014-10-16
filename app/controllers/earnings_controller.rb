class EarningsController < ApplicationController

  def index
    deal = Deal.find(params[:deal_id])
    earning = Earning.new(deal: deal)
    return unless earning.has_matching_cookie?(cookies.signed[:hidden_landing_page_ids])
    if params[:amount].present?
      earning.amount = params[:amount]
    end
    earning.save!
  end

end
