class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(:id)
  end

  def new
    @event = Event.new
  #  @categories = Category.all
  end
# Need to add categories to event creation
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :capacity, :date, :category_id, :user_id)
  end
end
