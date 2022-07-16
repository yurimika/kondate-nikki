class Tag < ApplicationRecord
  has_many :menu_tags
  has_many :menus, through: :menu_tags, dependent: :destroy
end
