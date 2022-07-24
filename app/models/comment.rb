class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :comment, presence: true, length: { maximum: 75 }
end
