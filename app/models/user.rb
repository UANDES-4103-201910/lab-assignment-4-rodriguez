class User < ApplicationRecord
  has_many :orders
  validates :name, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :phone, numericality: {only_integer: true, :greater_than_or_equal_to => 100000000, :less_than_or_equal_to => 999999999999}
  validates :password, format: {with: /(?=.*\d)(?=.*[a-zA-Z]).{4,12}/}#{with: /[A-Za-z0-9]/}

end
