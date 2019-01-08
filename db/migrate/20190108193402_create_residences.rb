class CreateResidences < ActiveRecord::Migration[5.2]
  def change
    create_table :residences do |t|
      t.integer :landlord_id, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.integer :square_meters, null: false
      t.timestamps
    end
  end
end
