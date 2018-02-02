require 'rails_helper'


RSpec.describe Motel, type: :model do
  context 'relationships' do
    before do 
      @user = create(:user)
      @motel = create(:motel, user: @user)
      @room = create(:room, motel: @motel)
      @booking = create(:booking, room: @room, motel: @motel)
    end
    it 'belongs to a user' do
      expect(@motel.user).to eq(@user)
    end
    it 'has rooms' do
      expect(@motel.rooms).to include(@room)
    end
    it 'has bookings' do 
      expect(@motel.bookings).to include(@booking)
    end
  end
end