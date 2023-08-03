class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user_id, foreign_key: { to_table: :users }
      t.references :product_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
