class OrderDetail < ApplicationRecord
  # belongs_to :order
  # belongs_to :album
  validates :order_id, :album_id, :customer_id, :quantity, presence: true
end
