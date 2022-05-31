class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @review = review.new(review_params)
        @event = Event.find(params[:event_id])
        @review.event = @event
        if @review.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to events_path(@event)
    end

private

    def review_params
        params.require(:review).permit(:content, :rating)
    end
end
