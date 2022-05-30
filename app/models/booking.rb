class Booking < ApplicationRecord
  belongs_to :user, :event
end
