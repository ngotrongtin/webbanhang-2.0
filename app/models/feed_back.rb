class FeedBack < ApplicationRecord
    belongs_to :reviewer, class_name: "User"
    belongs_to :product
end
