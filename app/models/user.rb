class User < ApplicationRecord
    attr_accessor :remember_token # make this virtual, available in class but not in database
    before_save :downcase_email
    has_secure_password
    has_many :carts, dependent: :destroy
    has_many :products, through: :carts
    has_many :transactions
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 20, minimum: 1 }
    validates :email, presence: true,length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }

    # Returns the hash digest of the given string.
    def User.digest(string) # User.digest or self.digest
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # update the remember_digest by the remember_token
    def remember 
        self.remember_token = User.new_token # self.remember_token to avoid conflict with local variable
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # check if the digest attibute is crypted by the given token
    def authenticate?(attribute, token)
        digest = send("#{attribute}_digest") # send turn string into method, in this case is getter and setter
        return false if digest.nil? 
        BCrypt::Password.new(digest).is_password?(token) # can replace .is_password? by ==
    end

    # set the remember_digest in database by nil
    def forget
        update_attribute(:remember_digest, nil)
    end

    def main_admin?
        self.email == "tigopro.1703@gmail.com"
    end

    # private because these method is only available in this class
    private
        def downcase_email
            self.email = email.downcase 
        end
end


