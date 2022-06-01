class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home events]

  def home
    @events = Event.all
  end
end
