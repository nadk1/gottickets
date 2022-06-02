class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @events = Event.search_by_name_and_location(params[:query])
    @events = Event.all
  end
end
