FactoryGirl.define do
  factory :booking do
    motel nil
    room nil
    amount_centavos 1
    fee_percentage 1.5
    booking_period "MyString"
    paid_at "2018-01-26 22:31:48"
    booking_code "MyString"
  end
end
