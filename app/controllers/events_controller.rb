class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_user

  def index
    if params[:query].present?
      @events = Event.search_by_name_and_location(params[:query])
    else
      @events = Event.all
    end
    @categories = Category.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def show
    @event_map = Event.where(id: params[:id])
    @booking = Booking.new
    @user = current_user
    @bookings = @event.bookings
    @current_user_booking = @bookings.where(user: @user).last
    @markers = @event_map.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :capacity, :date, :category_id, :user_id, :photo)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end
end
