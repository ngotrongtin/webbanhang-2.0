class CreateFeedBacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_backs do |t|
      t.integer :reviewer_id, null: false, foreign_key: { to_table: :users }
      t.integer :product_id, null: false, foreign_key: { to_table: :products }
      t.text :content

      t.timestamps
    end
  end
end
