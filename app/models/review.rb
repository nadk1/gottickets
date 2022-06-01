class Review < ApplicationRecord
  belongs_to :event #, through: :bookings
  belongs_to :user #, through: :bookings

  validates :content, presence: true, length: { minimum: 5 }
end
