class TrackingsController < ApplicationController

  def show
    landing_page = LandingPage.find_by_token(params[:id])
    ids = [landing_page.id, *cookies.signed[:hidden_landing_page_ids]]
    cookies.permanent.signed[:hidden_landing_page_ids] = ids
    redirect_to "http://#{landing_page.url}"
  end

end
