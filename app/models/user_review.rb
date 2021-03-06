class UserReview < ApplicationRecord
    belongs_to :dinner_guest
    has_one :dinner_party, through: :dinner_guest
    
    validates :review_text, length: {maximum: 200}
    RATING_LIST = [1, 2, 3, 4, 5]

end
