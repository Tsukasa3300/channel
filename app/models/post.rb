class Post < ApplicationRecord
  
belongs_to :user
has_many :comments, dependent: :destroy
has_many :users, through: :likes
default_scope -> { order(created_at: :desc) }
validates :user_id, presence: true
validates :content, presence: true, length: { maximum: 140 }
has_many :likes, dependent: :destroy
end

