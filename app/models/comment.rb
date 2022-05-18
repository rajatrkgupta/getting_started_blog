class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  has_many :likes, as: :liked_to, dependent: :destroy
end
