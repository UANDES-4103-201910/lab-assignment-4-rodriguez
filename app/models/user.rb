class User < ApplicationRecord
  has_many :orders
  validates :name, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, numericality: { only_integer: true }, length: { in: 9..12 }
  validates :password, length: {in: 8..12}, format: {with: /(?=.*\d)(?=.*[a-zA-Z])/}
end
