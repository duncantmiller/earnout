class EarningsController < ApplicationController

  def register_collection
    deal = Deal.find(params[:deal_id])
    earning = Earning.new(deal: deal)
    return unless earning.has_matching_cookie?(cookies.signed[:hidden_deal_ids])
    if params[:amount].present?
      earning.amount = params[:amount]
    end
    earning.save!
  end

  def index
    @earnings = Earning.all
  end

  def show
    @earning = Earning.find(params[:id])
  end

end
