class Album < ApplicationRecord
    # belongs_to :artist
    # has_many :order_detail
    # has_many :song
    validates :name, :artist_id, presence: true
    validates :price, comparison: { greater_than: 0 }
end
