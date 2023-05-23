class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom

  validates :start_date_time, presence: true
  validates :end_date_time, presence: true

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2
  }
end
