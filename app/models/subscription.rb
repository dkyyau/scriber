class Subscription < ApplicationRecord
  belongs_to :category

  has_one_attached :logo
end
