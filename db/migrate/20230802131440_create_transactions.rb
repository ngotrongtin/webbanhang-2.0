class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :customer_id, null: false, foreign_key: { to_table: :users }     
      t.integer :product_id, null: false, foreign_key: { to_table: :products }
      t.string :customer_email

      t.timestamps
    end
  end
end
