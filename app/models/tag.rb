class Tag < ApplicationRecord
  has_many :menu_tags, dependent: :destroy
  has_many :menus, through: :menu_tags
end
