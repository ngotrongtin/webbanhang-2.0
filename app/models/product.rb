class Product < ApplicationRecord
  has_many :transactions, dependent: :destroy
  has_many :feed_backs, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_one_attached :img
  validates :name, length: { minimum: 4, maximum: 30 }
  validates :name, presence: :true
  validates :price, length: { minimum: 4, maximum: 30 }
  validates :price, presence: :true
  validates :img,
            content_type: { in: %w[image/jpeg image/gif image/png],
                            message: "must be a valid image format" },
            size: { less_than: 5.megabytes,
                    message: "should be less than 5MB" }
end
