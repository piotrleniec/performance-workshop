class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.integer :room_id, null: false
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.boolean :student, null: false
      t.timestamps
    end
  end
end
