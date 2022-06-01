class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    @categories = Category.all
  end

  def show
    @booking = Booking.new
    @user = current_user
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
end
