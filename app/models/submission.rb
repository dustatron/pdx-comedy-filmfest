class Submission < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :length, presence: true
    validates :link, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { maximum: 250 }
    

    

end

