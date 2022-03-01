class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  has_many :likes

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def is_liked_by_user?(user_id)
    self.likes.find_by_user_id(user_id).present?
  end
end
