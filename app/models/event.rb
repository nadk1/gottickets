class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, source: :event
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CATEGORIES = Category.all

  validates :name, presence: true, uniqueness: { scope: :date,
                                                 message: "Already an event with that name on this date!" }
  validates :description, presence: true, length: { minimum: 50 }
  validates :location, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :date, presence: true
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
