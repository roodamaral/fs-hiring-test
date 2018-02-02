class CreateMotels < ActiveRecord::Migration
  def change
    create_table :motels do |t|
      t.string :name
      t.string :logo
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
