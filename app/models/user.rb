class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :profile_image
  has_many :menus, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_menus, through: :likes, source: :menu
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true

#ゲストログイン
  def self.guest
      find_or_create_by!(name: 'guestuser' ,email: 'guestusers@gmail.com') do |user|
       user.password = SecureRandom.urlsafe_base64
       user.name = "guestuser"
      end
  end

#画像
  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

#いいね
  def liked_by?(menu_id)
    likes.where(menu_id: menu_id).exists?
  end

#user検索
  def self.looks(word)
      @user = User.where("name LIKE?","#{word}")
  end

end
