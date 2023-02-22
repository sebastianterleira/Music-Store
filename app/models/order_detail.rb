class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :album
  belongs_to :customer
  validates :quantity, presence: true
end
