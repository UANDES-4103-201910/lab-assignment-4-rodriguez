class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validate :start_date_cannot_be_in_the_past, :venue_cannot_host_another_event_at_same_time

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def venue_cannot_host_another_event_at_same_time
    Event.where("event_venue_id = ?",self.event_venue_id).each do |another_event|
      if another_event.start_date == self.start_date
        errors.add(:event_venue_id, "already hosts another event on this date")
        break
      end
    end
  end

end
