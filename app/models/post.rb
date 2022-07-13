class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :photo
    validates :photo, attached: true
    #after_commit :send_mail, on: :create
    #after_commit :send_mail, on: :update

    def owner?(user) 
        user == self.user
    end

    private

    def post_created_mail
        PostMailer.with(post: self).new_post_email.deliver
    end

    def post_updated_mail
        PostMailer.with(post: self).edit_post_email.deliver
    end
end