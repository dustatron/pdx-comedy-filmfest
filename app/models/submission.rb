class Submission < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :length, presence: true
    validates :link, presence: true, length: { maximum: 200 }
    validates :description, presence: true, length: { maximum: 250 }
    validates :has_rights, :acceptance => true
    
    def send_new_submission_email
        UserMailer.submission_notification(self).deliver_now
    end
    

 

end

