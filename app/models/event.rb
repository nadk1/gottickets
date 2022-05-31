class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :bookings

  CATEGORIES = Category.all

  validates :name, presence: true, uniqueness: { scope: :date,
                                                 message: "Already an event with that name on this date!" }
  validates :description, presence: true, length: { minimum: 50 }
  validates :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :date, presence: true
end
