class Room < ActiveRecord::Base
  belongs_to :motel
  has_many :bookings
end
