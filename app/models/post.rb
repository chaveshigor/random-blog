class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true, length: { in: 6..50 }
  validates :body, presence: true, length: { in: 1..240 }

end
