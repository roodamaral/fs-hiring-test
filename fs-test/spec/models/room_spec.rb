require 'rails_helper'

require 'rails_helper'
RSpec.describe Room, type: :model do
  describe 'relationships' do
    before do
      @user = create(:user)
      @motel = create(:motel, user: @user)
      @room = create(:room, motel: @motel)
      @booking = create(:booking, room: @room, motel: @motel)
    end
    it 'belongs to a motel' do
      expect(@room.motel).to eq(@motel)
    end
    it 'has bookings' do
      expect(@room.bookings).to include(@booking)
    end
  end
end