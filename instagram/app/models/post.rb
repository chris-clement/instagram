class Post < ApplicationRecord
  has_one_attached :post_photo
  validates :content, presence: true
end
