class User < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    has_many :carts, dependent: :destroy
    has_many :products, through: :carts
    has_many :transactions
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 20, minimum: 1 }
    validates :email, presence: true,length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    

    # private because these method is only available in this class
    private
        def downcase_email
            self.email = email.downcase
        end
end


