class Menu < ApplicationRecord
   has_one_attached :image
   belongs_to :user
   has_many :menu_tags, dependent: :destroy
   has_many :tags, through: :menu_tags, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_users, through: :likes, source: :user
   has_many :comments, dependent: :destroy

   validates :comment, presence: true, length: { maximum: 75 }
   validates :start_time, presence: true

  #画像表示
  def get_image
   unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage-photo.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image
  end

  #検索
   def self.looks(word)
      @menu = Menu.where("menu_name_1 LIKE? OR food_detail_1 like? OR menu_name_2 LIKE?
      OR food_detail_2 like? OR menu_name_3 LIKE? OR food_detail_3 like? OR menu_name_4 LIKE? OR food_detail_4 like?
      OR menu_name_5 LIKE? OR food_detail_5 like? OR menu_name_6 LIKE? OR food_detail_6 like? OR menu_name_7 LIKE? OR food_detail_7 like?
      OR menu_name_8 LIKE? OR food_detail_8 like?","%#{word}%", "%#{word}%","%#{word}%","%#{word}%","%#{word}%",
      "%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%")
   end


end