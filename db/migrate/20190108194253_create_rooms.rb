class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :residence_id, null: false
      t.integer :square_meters, null: false
      t.boolean :furnished, null: false
      t.timestamps
    end
  end
end
