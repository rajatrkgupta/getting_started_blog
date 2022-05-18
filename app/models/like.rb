class Like < ApplicationRecord
  belongs_to :liked_to, polymorphic: true
  belongs_to :user
end
