class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :author_name, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
