
class Bathroom < ApplicationRecord
  has_one_attached :photo
  geocoded_by :address

  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :price, presence: true
  validates :address, presence: true
  validates :photo, presence: true

  after_validation :geocode, if: :will_save_change_to_address?

  enum availability: {
    unavailable: 0,
    available: 1
  }

  def host
    user
  end

  # --------PG Search - Nice to have ---------
  # include PgSearch::Model
  # pg_search_scope :search_by_description_and_location,
  # against: [ :description, :location ],
  # using: {
  #   tsearch: { prefix: true }
  # }
end
