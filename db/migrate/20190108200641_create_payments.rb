class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :tenant_id, null: false
      t.integer :price_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
