class Organization < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user # source: :user tells active record to use user_id
end
