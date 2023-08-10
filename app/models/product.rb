class Product < ApplicationRecord
    has_many :transactions
    has_many :feed_backs
    has_one_attached :img
    validates :name , length: {minimum: 4 , maximum: 30}
    validates :name, presence: :true
end
