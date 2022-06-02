class ReviewsController < ApplicationController
    def index
        @review = Review.new
    end
    
    def new
        @review = Review.new
        @user = current_user
        @current_user_booking = Booking.find(params[:booking_id])
    end

    def create
        @review = Review.new(review_params)
        @booking = Booking.find(params[:booking_id])
        @review.booking = @booking
        if @review.save
            redirect_to event_path(@booking.event)
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
