class HomeController < ApplicationController
  def index
  end
  def app_consulting
  end
  def lp_strategy
  end

  def robots
    render :file => Rails.root + "config/robots.#{Rails.env}.txt", layout: false
  end
end
