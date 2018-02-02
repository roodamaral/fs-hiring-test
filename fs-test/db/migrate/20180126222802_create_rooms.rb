class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :motel, index: true, foreign_key: true
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
