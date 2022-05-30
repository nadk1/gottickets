class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(:id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :capacity, :date, :category_id, :user_id)
  end
end
