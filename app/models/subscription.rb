class Subscription < ApplicationRecord
  belongs_to :category
  
  has_one_attached :logo
  has_many :reminders
end
