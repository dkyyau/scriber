class Subscription < ApplicationRecord
  belongs_to :category
  has_many :reminders
end
