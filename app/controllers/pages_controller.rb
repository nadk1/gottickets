class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user

  def home
    if params[:query].present?
      @events = Event.search_by_name_and_location(params[:query])
    else
      @events = Event.all
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  private

  def set_user
    @user = current_user if user_signed_in?
  end
end
