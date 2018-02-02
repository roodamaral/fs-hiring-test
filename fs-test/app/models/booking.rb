class Booking < ActiveRecord::Base
  belongs_to :motel
  belongs_to :room
end
