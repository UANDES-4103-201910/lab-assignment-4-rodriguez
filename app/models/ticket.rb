class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :ticket_cannot_be_created_after_the_start_date_of_the_event, :ticket_cannot_be_bought_after_the_start_date_of_the_event

  private
  def ticket_cannot_be_created_after_the_start_date_of_the_event
    if (Event.find_by id: self.ticket_type.event_id).start_date < DateTime.now
      puts "A ticket cannot be created after the start date of the associated event"
      throw :abort
    end
  end

  private
  def ticket_cannot_be_bought_after_the_start_date_of_the_event
    if (Event.find_by id: self.ticket_type.event_id).start_date < self.order.created_at
      puts "A ticket cannot be bought after the start date of the associated event"
      throw :abort
    end
  end

end
