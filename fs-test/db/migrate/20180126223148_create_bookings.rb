class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :motel, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.integer :amount_centavos
      t.float :fee_percentage
      t.string :booking_period
      t.datetime :paid_at
      t.string :booking_code

      t.timestamps null: false
    end
  end
end
