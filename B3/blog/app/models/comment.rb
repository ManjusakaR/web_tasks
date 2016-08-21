class Comment < ApplicationRecord
  belongs_to :post
  validates :email,:content, presence: true
end
