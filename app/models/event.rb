class Event < ApplicationRecord
  belongs_to :category, :user
end
