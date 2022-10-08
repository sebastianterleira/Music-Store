class Song < ApplicationRecord
  validates :name, presence: true
  validates :duration, comparison: { greater_than: 0 }
end
