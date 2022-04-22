class Employee < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  has_and_belongs_to_many :teams, -> { distinct }
end
