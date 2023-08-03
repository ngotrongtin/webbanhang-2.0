class Product < ApplicationRecord
    has_many :transactions
    has_many :feed_backs
end
