class ReviewsController < ApplicationController
    def index
        @review = Review.new
    end
    
    def new
        @review = Review.new
    end

    def create
        @review = review.new(review_params)
        @booking = Boooking.find(params[:booking_id])
        @review.booking = @booking
        if @review.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to event_path(@event)
    end

private

    def review_params
        params.require(:review).permit(:content, :rating, :booking_id)
    end
end
