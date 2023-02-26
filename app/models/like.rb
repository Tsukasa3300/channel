class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates :user_id, uniqueness: { scope: :post_id} 
  validates :post_id, uniqueness: { scope: :post_id} 
end
