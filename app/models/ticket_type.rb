class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone
  validates :price, numericality: {only_integer: true, :greater_than => 0}
end
