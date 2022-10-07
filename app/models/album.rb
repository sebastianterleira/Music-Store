class Album < ApplicationRecord
    validates :name, :artist_id, presence: true
    validates :price, comparison: { greater_than: 0 }
end
