class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  validates :price, numericality: {only_integer: true, :greater_than => 0}
end
