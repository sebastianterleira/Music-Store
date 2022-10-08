class Customer < ApplicationRecord
  PASSWORD_REQUIREMENTS = /\A
    (?=.{6,}) # At least 8 characters long
    (?=.*\d) # Contain at least one number
  /x
  validates :username, presence: true
  validates :password, format:{ with: PASSWORD_REQUIREMENTS, message: "For minimun 6 charactes and one number" } 
  validates :username, :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
