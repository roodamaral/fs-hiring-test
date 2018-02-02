class Motel < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :rooms 
end
