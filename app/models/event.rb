class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validates :creation


  def creation_ok
  	self.where("created_at > ?", Date.today)
  end 
  
  def creation
  	errors.add("The event cannot be today or in the past.") unless creation_ok
  end
end
