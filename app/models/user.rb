class User < ApplicationRecord
  validates :name, presence: true
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGRXP },
    uniqueness: { case_sensitive: false }
end
