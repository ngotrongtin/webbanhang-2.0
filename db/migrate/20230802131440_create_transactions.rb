class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :customer_id, null: false   
      t.integer :product_id, null: false
      t.string :customer_email

      t.timestamps
    end
    # co the cau hinh theo y muon
    add_foreign_key :transactions, :users , column: :customer_id 
    add_foreign_key :transactions, :products, column: :product_id
  end
end
