require 'rails_helper'
RSpec.describe User, type: :model do
  context "with valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
    it 'automatically encrypts the password into the password_digest attribute' do
      expect(build(:user).password_digest.present?).to eq(true)
    end 
    it 'email as lowercase' do 
      expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end
  context "with invalid attributes should not save if" do 
    it 'name is blank' do
      expect(build(:user, name: '')).to be_invalid
    end
    it 'email is blank' do
      expect(build(:user, email: '')).to be_invalid
    end
    it 'email format is wrong' do
      emails = ["@user", "@example.com"]
      emails.each do |email|
        expect(build(:user, email: email)).to be_invalid
      end
    end
    it 'email is not unique' do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it 'password is blank' do
      expect(build(:user, password: '')).to be_invalid
    end
    it "password doesn't match password_confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
  context 'relationships' do
    before do
      @user = create(:user)
      @motel = create(:motel, name: 'Motel 1', user: @user, logo: 'http://something.xxx/logo.jpg')
      @room = create(:room, name: 'beautiful room', motel: @motel, picture: 'http://something.xxx/logo.jpg')
      @booking = create(:booking, motel:@motel, room:@room, amount_centavos: '19000', fee_percentage: '.12', paid_at: DateTime.now, booking_period: "2 hors - Week", booking_code: 'XOPFJW')
    end
    it 'user has motel' do
      expect(@user.motels).to include(@motel)
    end
    it 'motel has room' do
      expect(@motel.rooms).to include(@room)
    end
    it "room has booking" do 
      expect(@room.bookings).to include(@booking)
    end
  end  
end