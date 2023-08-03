class User < ApplicationRecord
    has_secure_password
    has_many :carts, dependent: :destroy
    has_many :products, through: :carts
    has_many :transactions
end


