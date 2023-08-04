class CreateFeedBacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feed_backs do |t|
      t.integer :reviewer_id, null: false
      t.integer :product_id, null: false
      t.text :content

      t.timestamps
    end

    add_foreign_key :feed_backs, :users, column: :reviewer_id
    add_foreign_key :feed_backs, :products, column: :product_id
  end
end
