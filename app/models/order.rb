class Order < ApplicationRecord
  has_many :order_detail
  validates :date, presence: true,
                   comparison: { less_than: Time.zone.today, message: "Can't be in the future" }
  validates :total_price, comparison: { greater_than: 0, message: "Can't be negative" }
end
