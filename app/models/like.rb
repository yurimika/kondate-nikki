class Like < ApplicationRecord
  belongs_to :menu
  belongs_to :user
  validates_uniqueness_of :menu_id, scope: :user_id
end
