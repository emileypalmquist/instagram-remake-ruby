class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :saved_posts, dependent: :destroy

  # image association
  has_one_attached :photo, dependent: :destroy
end
