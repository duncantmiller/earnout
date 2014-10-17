class TrackingsController < ApplicationController

  def show
    landing_page = LandingPage.find_by_token(params[:id])
    deal = landing_page.deal
    ids = [deal.id, *cookies.signed[:hidden_deal_ids]]
    cookies.permanent.signed[:hidden_deal_ids] = ids
    redirect_to landing_page.url
  end

end
