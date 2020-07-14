class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :saved_posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    # self join association
    has_many :follower_follows, class_name: "Follow", foreign_key: :followee_id, dependent: :destroy
    has_many :followers, through: :follower_follows, source: :follower
    has_many :followee_followers, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
    has_many :following, through: :followee_followers, source: :followee

    # image association using Active Storage
    has_one_attached :profile_photo, dependent: :destroy

    # validations password
    has_secure_password
    validates :password, confirmation: true
    validates :password, :password_confirmation, presence: true, on: :create

    # other validations
    validates :username, uniqueness: true
    validates :name, presence: true
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
