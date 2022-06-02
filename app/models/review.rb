class Review < ApplicationRecord
  # belongs_to :event 
  # belongs_to :user 
  belongs_to :booking

  validates :content, presence: true, length: { minimum: 5 }
end
