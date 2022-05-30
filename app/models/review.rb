class Review < ApplicationRecord
  belongs_to :event, :user, through: :bookings

  validates :content, presence: true, length: { minimum: 5 }
end
