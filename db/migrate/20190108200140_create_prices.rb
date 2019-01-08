class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :room_id, null: false
      t.integer :amount, null: false
      t.boolean :all_bills_included, null: false
      t.timestamps
    end
  end
end
