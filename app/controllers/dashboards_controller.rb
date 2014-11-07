class DashboardsController < ApplicationController

  def home
    @deals = Deal.all
    @landing_pages = LandingPage.all
    @earnings = Earning.all
  end

end
