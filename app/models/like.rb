class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates :user_id, presence: true
  validates :post_id, presence: true
end