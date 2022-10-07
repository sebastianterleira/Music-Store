class OrderDetail < ApplicationRecord
  # belongs_to :order
  # belongs_to :album_song
  validates :order_id, :album_song_id, :quantity, presence: true
end
